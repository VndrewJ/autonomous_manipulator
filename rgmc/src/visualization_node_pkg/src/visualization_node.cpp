#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/filters/filter.h>

class VisualizationNode
{
public:
    VisualizationNode()
    {
        // Subscribe to the RealSense point cloud
        realsense_sub_ = nh_.subscribe("/camera/depth/color/points", 1, &VisualizationNode::realsenseCallback, this);

        // Subscribe to the aligned object cloud
        alignment_sub_ = nh_.subscribe("/aligned_object_cloud", 1, &VisualizationNode::alignmentCallback, this);

        // Publisher for visualizing the combined data
        overlay_pub_ = nh_.advertise<sensor_msgs::PointCloud2>("overlayed_cloud", 1);
    }

    void realsenseCallback(const sensor_msgs::PointCloud2ConstPtr &cloud_msg)
    {
        ROS_INFO("Received RealSense point cloud with size: %d", cloud_msg->width * cloud_msg->height);
        pcl::fromROSMsg(*cloud_msg, *realsense_cloud_);
        colorizeCloud(realsense_cloud_, 255, 255, 255); // Color RealSense cloud white
        overlayData();                                  // Attempt to overlay data if both clouds are available
    }

    void alignmentCallback(const sensor_msgs::PointCloud2ConstPtr &cloud_msg)
    {
        pcl::fromROSMsg(*cloud_msg, *alignment_cloud_); // Dereference the shared pointer
        colorizeCloud(alignment_cloud_, 255, 0, 0);     // Color aligned object cloud red
        overlayData();                                  // Attempt to overlay data if both clouds are available
    }

private:
    ros::NodeHandle nh_;
    ros::Subscriber realsense_sub_;
    ros::Subscriber alignment_sub_;
    ros::Publisher overlay_pub_;

    pcl::PointCloud<pcl::PointXYZRGB>::Ptr realsense_cloud_{new pcl::PointCloud<pcl::PointXYZRGB>};
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr alignment_cloud_{new pcl::PointCloud<pcl::PointXYZRGB>};

    void overlayData()
    {
        // Ensure both clouds are available before trying to overlay
        if (realsense_cloud_->empty())
        {
            ROS_WARN("RealSense cloud is empty");
            return;
        }
        if (alignment_cloud_->empty())
        {
            ROS_WARN("Aligned object cloud is empty");
            return;
        }

        // Debug message to check the size of the clouds
        ROS_INFO("RealSense cloud size: %lu", realsense_cloud_->points.size());
        ROS_INFO("Aligned object cloud size: %lu", alignment_cloud_->points.size());

        // Combine both point clouds
        pcl::PointCloud<pcl::PointXYZRGB>::Ptr combined_cloud(new pcl::PointCloud<pcl::PointXYZRGB>);
        *combined_cloud = *realsense_cloud_ + *alignment_cloud_; // Concatenate both clouds

        ROS_INFO("Combined cloud size: %lu", combined_cloud->points.size()); // Check combined cloud size

        // Publish the combined cloud
        sensor_msgs::PointCloud2 output_msg;
        pcl::toROSMsg(*combined_cloud, output_msg);
        output_msg.header.frame_id = "camera_link"; // Set the appropriate frame ID
        overlay_pub_.publish(output_msg);
    }

    // Function to colorize a cloud
    void colorizeCloud(pcl::PointCloud<pcl::PointXYZRGB>::Ptr &cloud, uint8_t r, uint8_t g, uint8_t b)
    {
        for (auto &point : cloud->points)
        {
            point.r = r;
            point.g = g;
            point.b = b;
        }
    }
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "visualization_node");
    VisualizationNode node;
    ros::spin();
    return 0;
}
