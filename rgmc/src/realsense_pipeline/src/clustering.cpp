#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl/filters/passthrough.h> // For PassThrough filter
#include <pcl/filters/extract_indices.h>
#include <pcl/segmentation/extract_clusters.h>
#include <pcl/io/pcd_io.h> // For loading reference PCD file
#include <realsense_pipeline/ClusterArray.h> // Custom message to represent multiple clusters

ros::Publisher cluster_pub;

int reference_object_size = 0;

void pointCloudCallback(const sensor_msgs::PointCloud2ConstPtr &cloud_msg) {
    // Convert ROS PointCloud2 message to PCL PointCloud
    pcl::PointCloud<pcl::PointXYZ>::Ptr input_cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::fromROSMsg(*cloud_msg, *input_cloud);

    // Step 1: Filter points beyond 2 meters
    pcl::PointCloud<pcl::PointXYZ>::Ptr filtered_cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PassThrough<pcl::PointXYZ> pass;
    pass.setInputCloud(input_cloud);
    pass.setFilterFieldName("z"); // Filter based on z-axis (depth)
    pass.setFilterLimits(0.0, 4.0); // Only keep points between 0 and 2 meters
    pass.filter(*filtered_cloud);

    // Step 2: Determine the min and max cluster sizes based on reference object size
    if (reference_object_size > 0) {
        int min_cluster_size = static_cast<int>(reference_object_size * 0.2);
        int max_cluster_size = static_cast<int>(reference_object_size * 1.8);

        // ROS_INFO("size: %i", reference_object_size);

        // Step 3: Apply Euclidean Cluster Extraction to find clusters in the filtered point cloud
        pcl::search::KdTree<pcl::PointXYZ>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZ>);
        tree->setInputCloud(filtered_cloud);

        std::vector<pcl::PointIndices> cluster_indices;
        pcl::EuclideanClusterExtraction<pcl::PointXYZ> ec;
        ec.setClusterTolerance(0.02); // Set the cluster tolerance in meters
        ec.setMinClusterSize(1000); // Set min cluster size dynamically
        ec.setMaxClusterSize(30000); // Set max cluster size dynamically
        ec.setSearchMethod(tree);
        ec.setInputCloud(filtered_cloud);
        ec.extract(cluster_indices);

        // Create a custom message to publish all clusters
        realsense_pipeline::ClusterArray cluster_array_msg;

        int cluster_id = 0;
        for (const auto &indices : cluster_indices) {
            pcl::PointCloud<pcl::PointXYZ>::Ptr cluster(new pcl::PointCloud<pcl::PointXYZ>);
            pcl::ExtractIndices<pcl::PointXYZ> extract;
            pcl::PointIndices::Ptr cluster_indices_ptr(new pcl::PointIndices(indices));
            extract.setInputCloud(filtered_cloud);
            extract.setIndices(cluster_indices_ptr);
            extract.setNegative(false);
            extract.filter(*cluster);

            // Convert the cluster to ROS message
            sensor_msgs::PointCloud2 cluster_msg;
            pcl::toROSMsg(*cluster, cluster_msg);
            cluster_msg.header.frame_id = cloud_msg->header.frame_id;

            // Add to cluster array
            cluster_array_msg.clusters.push_back(cluster_msg);
            cluster_id++;
        }

        ROS_INFO("size is: %i", cluster_id);
        // Publish the clusters
        cluster_pub.publish(cluster_array_msg);
    } else {
        ROS_WARN("Reference object size is not set. Skipping clustering.");
    }
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "clustering_node");
    ros::NodeHandle nh;

    // Load the reference object point cloud from a PCD file
    std::string reference_pcd_file = "/home/mechp4p/autonomous_manipulator/rgmc/src/realsense_pipeline/data/data_17-13-20/cluster_4/point_cloud_frame_10.pcd";
    pcl::PointCloud<pcl::PointXYZ>::Ptr reference_cloud(new pcl::PointCloud<pcl::PointXYZ>);
    if (pcl::io::loadPCDFile(reference_pcd_file, *reference_cloud) == -1) {
        ROS_ERROR("Could not load reference PCD file: %s", reference_pcd_file.c_str());
        return -1;
    }

    // Set the reference object size
    reference_object_size = reference_cloud->points.size();
    ROS_INFO("Loaded reference object with %d points", reference_object_size);

    // Subscribe to the RealSense point cloud topic
    ros::Subscriber sub = nh.subscribe<sensor_msgs::PointCloud2>("/camera/depth/color/points", 1, pointCloudCallback);

    // Advertise the cluster array
    cluster_pub = nh.advertise<realsense_pipeline::ClusterArray>("clusters", 1);

    ros::spin();

    return 0;
}
