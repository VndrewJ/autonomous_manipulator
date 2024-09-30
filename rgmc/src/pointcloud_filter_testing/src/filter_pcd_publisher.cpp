#include <ros/ros.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/filters/passthrough.h>
#include <sensor_msgs/PointCloud2.h>

ros::Publisher pub;

void cloudCallback(const sensor_msgs::PointCloud2ConstPtr& input)
{
    // static ros::Time last_time = ros::Time::now();
    // ros::Duration interval(1.0 / 5.0); // Set the rate to 2 Hz (change this value as needed)

    // if ((ros::Time::now() - last_time) < interval) {
    //     // If the interval hasn't elapsed, skip processing
    //     return;
    // }
    // last_time = ros::Time::now();
    // Convert the sensor_msgs/PointCloud2 data to pcl/PointCloud<PointXYZ>
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::fromROSMsg(*input, *cloud);

    // Create a PassThrough filter to remove points further than 2 meters
    pcl::PassThrough<pcl::PointXYZ> pass;
    pass.setInputCloud(cloud);
    pass.setFilterFieldName("z");
    pass.setFilterLimits(0.0, 1.5);  // Keep points between 0 and 2 meters

    pcl::PointCloud<pcl::PointXYZ>::Ptr filtered_cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pass.filter(*filtered_cloud);

    // Convert the pcl/PointCloud back to sensor_msgs/PointCloud2
    sensor_msgs::PointCloud2 output;
    pcl::toROSMsg(*filtered_cloud, output);
    output.header = input->header;

    // Publish the filtered cloud
    pub.publish(output);
}

int main(int argc, char** argv)
{
    // Initialize ROS
    ros::init(argc, argv, "pointcloud_filter_publisher");
    ros::NodeHandle nh;

    // Create a ROS subscriber for the input point cloud
    ros::Subscriber sub = nh.subscribe("/camera/depth/color/points", 1, cloudCallback);

    // Create a ROS publisher for the filtered point cloud
    pub = nh.advertise<sensor_msgs::PointCloud2>("filtered_points", 1);

    // Spin
    ros::spin();

    return 0;
}
