#include <ros/ros.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/filters/passthrough.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl/filters/statistical_outlier_removal.h>  // Added header for SOR filter
#include <pcl/surface/mls.h>                          // Added header for MLS filter
#include <pcl/search/kdtree.h>                         // Added header for KDTree search

ros::Publisher pub;

void cloudCallback(const sensor_msgs::PointCloud2ConstPtr& input)
{
    // Convert the sensor_msgs/PointCloud2 data to pcl::PointCloud<pcl::PointXYZ>
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::fromROSMsg(*input, *cloud);

    // Create a PassThrough filter to remove points further than 0.99 meters
    pcl::PassThrough<pcl::PointXYZ> pass;
    pass.setInputCloud(cloud);
    pass.setFilterFieldName("z");
    pass.setFilterLimits(0.0, 0.99);  // Keep points between 0 and 0.99 meters
    pcl::PointCloud<pcl::PointXYZ>::Ptr filtered_cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pass.filter(*filtered_cloud);

    // Apply Statistical Outlier Removal (SOR) filter to remove noisy points
    pcl::StatisticalOutlierRemoval<pcl::PointXYZ> sor;
    sor.setInputCloud(filtered_cloud);
    sor.setMeanK(50);               // Number of neighbors to analyze
    sor.setStddevMulThresh(1.0);    // Threshold multiplier for distance
    pcl::PointCloud<pcl::PointXYZ>::Ptr sor_filtered_cloud(new pcl::PointCloud<pcl::PointXYZ>);
    sor.filter(*sor_filtered_cloud);

    // Apply Moving Least Squares (MLS) for smoothing the point cloud
    pcl::PointCloud<pcl::PointXYZ>::Ptr smoothed_cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::MovingLeastSquares<pcl::PointXYZ, pcl::PointXYZ> mls;
    mls.setInputCloud(sor_filtered_cloud);
    mls.setComputeNormals(false);
    mls.setSearchRadius(0.03);  // Radius for surface smoothing
    mls.setPolynomialFit(true);
    pcl::search::KdTree<pcl::PointXYZ>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZ>);
    mls.setSearchMethod(tree);
    mls.process(*smoothed_cloud);

    // Convert the pcl::PointCloud back to sensor_msgs::PointCloud2
    sensor_msgs::PointCloud2 output;
    pcl::toROSMsg(*smoothed_cloud, output);
    output.header = input->header;

    // Publish the filtered and smoothed cloud
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
