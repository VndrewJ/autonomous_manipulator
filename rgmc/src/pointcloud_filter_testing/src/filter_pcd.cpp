#include <ros/ros.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/io/pcd_io.h>
#include <pcl/filters/passthrough.h>
#include <sensor_msgs/PointCloud2.h>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "pcd_filter_node");
    ros::NodeHandle nh;

    if (argc < 2) {
        ROS_ERROR("Please specify a PCD file path.");
        return -1;
    }

    std::string pcd_file = argv[1];

    // Load the PCD file
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
    if (pcl::io::loadPCDFile<pcl::PointXYZ>(pcd_file, *cloud) == -1) {
        ROS_ERROR("Couldn't read the PCD file.");
        return -1;
    }
    ROS_INFO("Loaded PCD file with %lu points.", cloud->points.size());

    // Create a PassThrough filter to remove points further than 2 meters
    pcl::PassThrough<pcl::PointXYZ> pass;
    pass.setInputCloud(cloud);
    pass.setFilterFieldName("z");
    pass.setFilterLimits(0.0, 2.0);  // Keep points between 0 and 2 meters
    pcl::PointCloud<pcl::PointXYZ>::Ptr filtered_cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pass.filter(*filtered_cloud);

    ROS_INFO("Filtered cloud has %lu points.", filtered_cloud->points.size());

    // Save the filtered cloud to a new PCD file
    pcl::io::savePCDFileASCII("filtered_output.pcd", *filtered_cloud);
    ROS_INFO("Filtered point cloud saved to filtered_output.pcd.");

    return 0;
}
