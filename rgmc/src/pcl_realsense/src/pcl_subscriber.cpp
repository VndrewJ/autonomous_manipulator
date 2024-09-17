#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/visualization/cloud_viewer.h>

void pointCloudCallback(const sensor_msgs::PointCloud2ConstPtr& input) {
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::fromROSMsg(*input, *cloud);

    // Perform operations on the point cloud data
    // Here, we simply visualize it using PCL's CloudViewer

    pcl::visualization::CloudViewer viewer("Cloud Viewer");
    viewer.showCloud(cloud);
    while (!viewer.wasStopped()) {
    }
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "pointcloud_subscriber_node");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("realsense/points", 10, pointCloudCallback);

    ros::spin();
    return 0;
}
