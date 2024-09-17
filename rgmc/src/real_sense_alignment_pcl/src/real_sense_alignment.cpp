#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>

// Include the headers you already have for the alignment_prerejective code
#include <pcl/registration/sample_consensus_prerejective.h>
#include <pcl/features/normal_3d.h>
#include <pcl/filters/uniform_sampling.h>
#include <pcl/keypoints/sift_keypoint.h>
#include <pcl/features/fpfh.h>
#include <pcl/features/vfh.h>

class AlignmentNode
{
public:
    AlignmentNode()
    {
        // Subscribe to the RealSense point cloud topic
        pointcloud_sub_ = nh_.subscribe("/camera/depth/color/points", 1, &AlignmentNode::pointCloudCallback, this);
        // Initialize the publisher for the aligned object
        pub_ = nh_.advertise<sensor_msgs::PointCloud2>("aligned_object_cloud", 1);
        // Load the object PCD file
        pcl::io::loadPCDFile<pcl::PointXYZ>("/home/mechp4p/autonomous_manipulator/rgmc/src/real_sense_alignment_pcl/data/chef.pcd", *object_cloud_);
    }

    void pointCloudCallback(const sensor_msgs::PointCloud2ConstPtr &cloud_msg)
    {
        // Convert the sensor_msgs/PointCloud2 to PCL point cloud
        pcl::fromROSMsg(*cloud_msg, *scene_cloud_);

        // Now process the object and scene using alignment_prerejective code
        runAlignment();
    }

private:
    ros::NodeHandle nh_;
    ros::Subscriber pointcloud_sub_;
    ros::Publisher pub_;

    pcl::PointCloud<pcl::PointXYZ>::Ptr object_cloud_{new pcl::PointCloud<pcl::PointXYZ>};
    pcl::PointCloud<pcl::PointXYZ>::Ptr scene_cloud_{new pcl::PointCloud<pcl::PointXYZ>};

    // Function to run alignment (this is where your current alignment code goes)
    void runAlignment()
    {
        // Ensure that both object and scene clouds are valid
        if (object_cloud_->empty() || scene_cloud_->empty())
        {
            ROS_WARN("Object or Scene cloud is empty. Cannot run alignment.");
            return;
        }

        // Downsample the object and scene clouds using voxel grid filtering
        pcl::PointCloud<pcl::PointXYZ>::Ptr object_downsampled(new pcl::PointCloud<pcl::PointXYZ>);
        pcl::PointCloud<pcl::PointXYZ>::Ptr scene_downsampled(new pcl::PointCloud<pcl::PointXYZ>);

        pcl::VoxelGrid<pcl::PointXYZ> voxel_grid;
        voxel_grid.setLeafSize(0.01f, 0.01f, 0.01f); // Adjust the leaf size based on your setup

        voxel_grid.setInputCloud(object_cloud_);
        voxel_grid.filter(*object_downsampled);

        voxel_grid.setInputCloud(scene_cloud_);
        voxel_grid.filter(*scene_downsampled);

        // Estimate normals for object and scene
        pcl::PointCloud<pcl::Normal>::Ptr object_normals(new pcl::PointCloud<pcl::Normal>);
        pcl::PointCloud<pcl::Normal>::Ptr scene_normals(new pcl::PointCloud<pcl::Normal>);

        pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> normal_estimation;
        normal_estimation.setRadiusSearch(0.02);

        normal_estimation.setInputCloud(object_downsampled);
        pcl::search::KdTree<pcl::PointXYZ>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZ>);
        normal_estimation.setSearchMethod(tree);
        normal_estimation.compute(*object_normals);

        normal_estimation.setInputCloud(scene_downsampled);
        normal_estimation.compute(*scene_normals);

        // Estimate FPFH descriptors for object and scene
        pcl::PointCloud<pcl::FPFHSignature33>::Ptr object_features(new pcl::PointCloud<pcl::FPFHSignature33>);
        pcl::PointCloud<pcl::FPFHSignature33>::Ptr scene_features(new pcl::PointCloud<pcl::FPFHSignature33>);

        pcl::FPFHEstimation<pcl::PointXYZ, pcl::Normal, pcl::FPFHSignature33> fpfh;
        fpfh.setRadiusSearch(0.05);

        fpfh.setInputCloud(object_downsampled);
        fpfh.setInputNormals(object_normals);
        fpfh.compute(*object_features);

        fpfh.setInputCloud(scene_downsampled);
        fpfh.setInputNormals(scene_normals);
        fpfh.compute(*scene_features);

        // Perform alignment using Sample Consensus Prerejective
        pcl::SampleConsensusPrerejective<pcl::PointXYZ, pcl::PointXYZ, pcl::FPFHSignature33> align;
        align.setInputSource(object_downsampled);
        align.setSourceFeatures(object_features);
        align.setInputTarget(scene_downsampled);
        align.setTargetFeatures(scene_features);

        align.setMaximumIterations(50000);                // Number of RANSAC iterations
        align.setNumberOfSamples(3);                      // Number of points to sample for generating/prerejecting a pose
        align.setCorrespondenceRandomness(5);             // Number of nearest features to use
        align.setSimilarityThreshold(0.9f);               // Polygonal edge length similarity threshold
        align.setMaxCorrespondenceDistance(2.5f * 0.01f); // Inliers threshold
        align.setInlierFraction(0.25f);                   // Required inlier fraction for accepting a pose hypothesis

        pcl::PointCloud<pcl::PointXYZ> aligned_object;
        align.align(aligned_object);

        if (align.hasConverged())
        {
            ROS_INFO("Alignment succeeded. Fitness score: %f", align.getFitnessScore());
            // Optionally: Get the transformation
            Eigen::Matrix4f transformation = align.getFinalTransformation();
            ROS_INFO_STREAM("Transformation Matrix:\n"
                            << transformation);

            // Optionally publish the aligned object
            sensor_msgs::PointCloud2 aligned_msg;
            pcl::toROSMsg(aligned_object, aligned_msg);
            aligned_msg.header.frame_id = "camera_link"; // Set the appropriate frame
            pub_.publish(aligned_msg);
        }
        else
        {
            ROS_WARN("Alignment failed.");
        }
    }
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "alignment_prerejective_node");

    AlignmentNode alignment_node;

    ros::spin(); // Keep the node alive
    return 0;
}
