#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/io/pcd_io.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/features/normal_3d.h>
#include <pcl/features/fpfh.h>
#include <pcl/registration/ia_ransac.h>
#include <sensor_msgs/PointCloud2.h>
#include <tf2_ros/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>
#include <pcl/registration/sample_consensus_prerejective.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <thread>
#include <future>

ros::Publisher pub;
tf2_ros::TransformBroadcaster *tf_broadcaster;
pcl::visualization::PCLVisualizer::Ptr viewer(new pcl::visualization::PCLVisualizer("3D Viewer"));

// Visualization setup
void setupViewer()
{
    viewer->setBackgroundColor(0, 0, 0);
    viewer->addCoordinateSystem(0.1);
    viewer->initCameraParameters();
}

// Function to estimate normals
pcl::PointCloud<pcl::Normal>::Ptr estimateNormals(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud)
{
    pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> ne;
    pcl::search::KdTree<pcl::PointXYZ>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZ>);
    ne.setInputCloud(cloud);
    ne.setSearchMethod(tree);
    ne.setKSearch(10);

    pcl::PointCloud<pcl::Normal>::Ptr normals(new pcl::PointCloud<pcl::Normal>);
    ne.compute(*normals);

    return normals;
}

// Function to compute FPFH features
pcl::PointCloud<pcl::FPFHSignature33>::Ptr computeFPFHFeatures(pcl::PointCloud<pcl::PointXYZ>::Ptr cloud, pcl::PointCloud<pcl::Normal>::Ptr normals)
{
    pcl::FPFHEstimation<pcl::PointXYZ, pcl::Normal, pcl::FPFHSignature33> fpfh;
    pcl::search::KdTree<pcl::PointXYZ>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZ>);
    fpfh.setInputCloud(cloud);
    fpfh.setInputNormals(normals);
    fpfh.setSearchMethod(tree);
    fpfh.setRadiusSearch(0.03);

    pcl::PointCloud<pcl::FPFHSignature33>::Ptr features(new pcl::PointCloud<pcl::FPFHSignature33>);
    fpfh.compute(*features);

    return features;
}

void cloudCallback(const sensor_msgs::PointCloud2ConstPtr &input)
{
    // Convert the sensor_msgs/PointCloud2 data to pcl::PointCloud<PointXYZ>
    pcl::PointCloud<pcl::PointXYZ>::Ptr scene(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::fromROSMsg(*input, *scene);

    // Load object point cloud (this can be read from a PCD file or set statically)
    pcl::PointCloud<pcl::PointXYZ>::Ptr object(new pcl::PointCloud<pcl::PointXYZ>);
    if (pcl::io::loadPCDFile<pcl::PointXYZ>("/home/mechp4p/autonomous_manipulator/rgmc/src/real_sense_alignment_pcl/data/object_converted.pcd", *object) == -1)
    {
        ROS_ERROR("Couldn't read object PCD file.");
        return;
    }

    // Downsample the point clouds for processing
    pcl::VoxelGrid<pcl::PointXYZ> grid;
    const float leaf = 0.005f; // Increase the leaf size for more aggressive downsampling
    grid.setLeafSize(leaf, leaf, leaf);
    grid.setInputCloud(object);
    grid.filter(*object);
    grid.setInputCloud(scene);
    grid.filter(*scene);

    // Estimate normals for object and scene concurrently
    auto object_normals_future = std::async(std::launch::async, estimateNormals, object);
    auto scene_normals_future = std::async(std::launch::async, estimateNormals, scene);

    pcl::PointCloud<pcl::Normal>::Ptr object_normals = object_normals_future.get();
    pcl::PointCloud<pcl::Normal>::Ptr scene_normals = scene_normals_future.get();

    // Compute features for object and scene concurrently
    auto object_features_future = std::async(std::launch::async, computeFPFHFeatures, object, object_normals);
    auto scene_features_future = std::async(std::launch::async, computeFPFHFeatures, scene, scene_normals);

    pcl::PointCloud<pcl::FPFHSignature33>::Ptr object_features = object_features_future.get();
    pcl::PointCloud<pcl::FPFHSignature33>::Ptr scene_features = scene_features_future.get();

    // Perform alignment
    pcl::SampleConsensusPrerejective<pcl::PointXYZ, pcl::PointXYZ, pcl::FPFHSignature33> align;
    align.setInputSource(object);
    align.setSourceFeatures(object_features);
    align.setInputTarget(scene);
    align.setTargetFeatures(scene_features);
    align.setMaximumIterations(5000000);             // Number of RANSAC iterations
    align.setNumberOfSamples(3);                     // Number of points to sample for generating/prerejecting a pose
    align.setCorrespondenceRandomness(5);            // Number of nearest features to use
    align.setSimilarityThreshold(0.9f);              // Polygonal edge length similarity threshold
    align.setMaxCorrespondenceDistance(2.5f * leaf); // Inlier threshold
    align.setInlierFraction(0.25f);                  // Required inlier fraction for accepting a pose hypothesis

    pcl::PointCloud<pcl::PointXYZ>::Ptr aligned_object(new pcl::PointCloud<pcl::PointXYZ>);
    align.align(*aligned_object);

    if (align.hasConverged())
    {
        // Broadcast the transform
        Eigen::Matrix4f transformation = align.getFinalTransformation();
        geometry_msgs::TransformStamped transform;
        transform.header.stamp = ros::Time::now();
        transform.header.frame_id = "camera_frame";
        transform.child_frame_id = "object_frame";
        transform.transform.translation.x = transformation(0, 3);
        transform.transform.translation.y = transformation(1, 3);
        transform.transform.translation.z = transformation(2, 3);
        Eigen::Quaternionf q(transformation.block<3, 3>(0, 0));
        transform.transform.rotation.x = q.x();
        transform.transform.rotation.y = q.y();
        transform.transform.rotation.z = q.z();
        transform.transform.rotation.w = q.w();

        tf_broadcaster->sendTransform(transform);

        ROS_INFO_STREAM("Transform: "
                        << "\nTranslation: [" << transform.transform.translation.x << ", "
                        << transform.transform.translation.y << ", " << transform.transform.translation.z << "]"
                        << "\nRotation (quaternion): [" << transform.transform.rotation.x << ", "
                        << transform.transform.rotation.y << ", " << transform.transform.rotation.z << ", "
                        << transform.transform.rotation.w << "]");

        // Update visualization
        viewer->removeAllPointClouds();
        viewer->addPointCloud<pcl::PointXYZ>(scene, "scene_cloud");
        viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_COLOR, 0.0, 1.0, 0.0, "scene_cloud");
        viewer->addPointCloud<pcl::PointXYZ>(aligned_object, "aligned_object_cloud");
        viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_COLOR, 0.0, 0.0, 1.0, "aligned_object_cloud");
        viewer->spinOnce(100);
    }
    else
    {
        ROS_ERROR("Alignment did not converge!");
    }
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "real_sense_alignment_node");
    ros::NodeHandle nh;

    setupViewer();

    tf_broadcaster = new tf2_ros::TransformBroadcaster();

    ros::Subscriber sub = nh.subscribe("filtered_points", 1, cloudCallback);

    ros::Rate rate(10); // Adjust as needed
    while (ros::ok() && !viewer->wasStopped())
    {
        ros::spinOnce();
        viewer->spinOnce(100);
        rate.sleep();
    }

    delete tf_broadcaster;
    return 0;
}