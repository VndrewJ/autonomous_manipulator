#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl/io/pcd_io.h>
#include <pcl/registration/sample_consensus_prerejective.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/features/fpfh_omp.h>
#include <pcl/features/normal_3d_omp.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <tf/transform_broadcaster.h>

typedef pcl::PointXYZ PointT;

ros::Publisher pose_pub;
pcl::PointCloud<PointT>::Ptr object(new pcl::PointCloud<PointT>);
pcl::PointCloud<pcl::FPFHSignature33>::Ptr object_features(new pcl::PointCloud<pcl::FPFHSignature33>);

bool object_loaded = false;

// Function to load object PCD file
bool loadObjectModel(const std::string& object_pcd) {
    if (pcl::io::loadPCDFile<PointT>(object_pcd, *object) < 0) {
        ROS_ERROR("Failed to load object PCD file!");
        return false;
    }

    // Estimate object normals
    pcl::NormalEstimationOMP<PointT, pcl::Normal> nest;
    pcl::PointCloud<pcl::Normal>::Ptr object_normals(new pcl::PointCloud<pcl::Normal>);
    pcl::search::KdTree<PointT>::Ptr tree(new pcl::search::KdTree<PointT>);
    nest.setSearchMethod(tree);
    nest.setRadiusSearch(0.01);
    nest.setInputCloud(object);
    nest.compute(*object_normals);

    // Compute object features
    pcl::FPFHEstimationOMP<PointT, pcl::Normal, pcl::FPFHSignature33> fest;
    fest.setRadiusSearch(0.05);
    fest.setInputCloud(object);
    fest.setInputNormals(object_normals);
    fest.compute(*object_features);

    object_loaded = true;
    return true;
}

// Callback to process incoming scene point cloud from camera
void pointCloudCallback(const sensor_msgs::PointCloud2ConstPtr& cloud_msg) {
    if (!object_loaded) {
        ROS_WARN("Object not loaded yet.");
        return;
    }

    pcl::PointCloud<PointT>::Ptr scene(new pcl::PointCloud<PointT>);
    pcl::fromROSMsg(*cloud_msg, *scene);

    // Downsample the scene
    pcl::VoxelGrid<PointT> grid;
    grid.setLeafSize(0.01f, 0.01f, 0.01f);
    pcl::PointCloud<PointT>::Ptr scene_downsampled(new pcl::PointCloud<PointT>);
    grid.setInputCloud(scene);
    grid.filter(*scene_downsampled);

    // Estimate scene normals
    pcl::NormalEstimationOMP<PointT, pcl::Normal> nest;
    pcl::PointCloud<pcl::Normal>::Ptr scene_normals(new pcl::PointCloud<pcl::Normal>);
    nest.setRadiusSearch(0.01);
    nest.setInputCloud(scene_downsampled);
    nest.compute(*scene_normals);

    // Compute scene features
    pcl::PointCloud<pcl::FPFHSignature33>::Ptr scene_features(new pcl::PointCloud<pcl::FPFHSignature33>);
    pcl::FPFHEstimationOMP<PointT, pcl::Normal, pcl::FPFHSignature33> fest;
    fest.setRadiusSearch(0.05);
    fest.setInputCloud(scene_downsampled);
    fest.setInputNormals(scene_normals);
    fest.compute(*scene_features);

    // Perform alignment
    pcl::SampleConsensusPrerejective<PointT, PointT, pcl::FPFHSignature33> align;
    align.setInputSource(object);
    align.setSourceFeatures(object_features);
    align.setInputTarget(scene_downsampled);
    align.setTargetFeatures(scene_features);
    align.setMaximumIterations(50000);  // Number of iterations
    align.setNumberOfSamples(3);        // Number of points to sample for generating/prerejecting a pose
    align.setCorrespondenceRandomness(5);  // Number of nearest features to use
    align.setSimilarityThreshold(0.9f);   // Polygonal edge length similarity threshold
    align.setMaxCorrespondenceDistance(0.05);  // Inlier threshold
    align.setInlierFraction(0.25f);       // Required inlier fraction

    pcl::PointCloud<PointT>::Ptr object_aligned(new pcl::PointCloud<PointT>);
    align.align(*object_aligned);

    if (align.hasConverged()) {
        ROS_INFO("Alignment succeeded!");
        Eigen::Matrix4f transformation = align.getFinalTransformation();

        // Extract translation (position)
        Eigen::Vector3f translation = transformation.block<3, 1>(0, 3);
        Eigen::Matrix3f rotation = transformation.block<3, 3>(0, 0);

        ROS_INFO_STREAM("Object Position: \n" << translation);
        ROS_INFO_STREAM("Object Rotation: \n" << rotation);

        // Publish the transform between camera and object
        static tf::TransformBroadcaster br;
        tf::Transform transform;
        transform.setOrigin(tf::Vector3(translation[0], translation[1], translation[2]));

        // Convert rotation matrix to quaternion
        tf::Matrix3x3 tf_rot(rotation(0,0), rotation(0,1), rotation(0,2),
                             rotation(1,0), rotation(1,1), rotation(1,2),
                             rotation(2,0), rotation(2,1), rotation(2,2));
        tf::Quaternion q;
        tf_rot.getRotation(q);
        transform.setRotation(q);

        br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "camera_frame", "object_frame"));
    } else {
        ROS_WARN("Alignment failed!");
    }
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "object_recognition_node");
    ros::NodeHandle nh;

    // Load the object model
    if (!loadObjectModel("/home/mechp4p/Desktop/Catkin/src/alignment_prerejective_node/data/object_converted.pcd")) {
        ROS_ERROR("Object loading failed!");
        return -1;
    }

    // Subscribe to the correct scene point cloud topic
    ros::Subscriber sub = nh.subscribe("/scene_cloud", 1, pointCloudCallback);

    ros::spin();

    return 0;
}
