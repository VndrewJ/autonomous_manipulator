#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/Image.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/opencv.hpp>

class VisualizationNode
{
public:
    VisualizationNode()
    {
        // Subscribe to the RealSense point cloud
        realsense_sub_ = nh_.subscribe("/camera/depth/color/points", 1, &VisualizationNode::realsenseCallback, this);

        // Subscribe to the aligned object cloud
        alignment_sub_ = nh_.subscribe("/aligned_object_cloud", 1, &VisualizationNode::alignmentCallback, this);

        // Subscribe to the color image topic
        image_sub_ = nh_.subscribe("/camera/color/image_raw", 1, &VisualizationNode::imageCallback, this);

        // Publisher for visualizing the combined data
        overlay_pub_ = nh_.advertise<sensor_msgs::PointCloud2>("overlayed_cloud", 1);
    }

    void realsenseCallback(const sensor_msgs::PointCloud2ConstPtr &cloud_msg)
    {
        ROS_INFO("Received RealSense point cloud with size: %d", cloud_msg->width * cloud_msg->height);
        pcl::fromROSMsg(*cloud_msg, *real_sense_cloud_);

        if (image_received_)
        {
            // If the color image has been received, combine the point cloud and color data
            pcl::PointCloud<pcl::PointXYZRGB>::Ptr colored_cloud(new pcl::PointCloud<pcl::PointXYZRGB>);
            combinePointCloudWithImage(real_sense_cloud_, colored_cloud);

            // Publish the colored point cloud
            sensor_msgs::PointCloud2 output;
            pcl::toROSMsg(*colored_cloud, output);
            output.header = cloud_msg->header;
            overlay_pub_.publish(output);
        }
    }

    void alignmentCallback(const sensor_msgs::PointCloud2ConstPtr &aligned_msg)
    {
        ROS_INFO("Received aligned object cloud.");
        pcl::fromROSMsg(*aligned_msg, *aligned_object_cloud_);

        // You can further process or visualize the aligned object here
    }

    void imageCallback(const sensor_msgs::ImageConstPtr &image_msg)
    {
        try
        {
            cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(image_msg, sensor_msgs::image_encodings::BGR8);
            color_image_ = cv_ptr->image;
            image_received_ = true;
        }
        catch (cv_bridge::Exception &e)
        {
            ROS_ERROR("cv_bridge exception: %s", e.what());
        }
    }

private:
    ros::NodeHandle nh_;
    ros::Subscriber realsense_sub_;
    ros::Subscriber alignment_sub_;
    ros::Subscriber image_sub_;
    ros::Publisher overlay_pub_;

    pcl::PointCloud<pcl::PointXYZ>::Ptr real_sense_cloud_{new pcl::PointCloud<pcl::PointXYZ>};
    pcl::PointCloud<pcl::PointXYZ>::Ptr aligned_object_cloud_{new pcl::PointCloud<pcl::PointXYZ>};
    cv::Mat color_image_; // Store the color image
    bool image_received_ = false; // Check if the color image has been received

    // Intrinsics for the RealSense D435i at 1280x720 resolution
    const float fx = 910.469;
    const float fy = 911.344;
    const float cx = 629.490;
    const float cy = 365.323;

    // Function to combine point cloud with color image
    void combinePointCloudWithImage(const pcl::PointCloud<pcl::PointXYZ>::Ptr &cloud_in, pcl::PointCloud<pcl::PointXYZRGB>::Ptr &cloud_out)
    {
        cloud_out->width = cloud_in->width;
        cloud_out->height = cloud_in->height;
        cloud_out->is_dense = cloud_in->is_dense;
        cloud_out->points.resize(cloud_out->width * cloud_out->height);

        for (size_t i = 0; i < cloud_in->points.size(); ++i)
        {
            pcl::PointXYZ point = cloud_in->points[i];
            pcl::PointXYZRGB point_rgb;
            point_rgb.x = point.x;
            point_rgb.y = point.y;
            point_rgb.z = point.z;

            // Map the color from the image to the point cloud
            int u = static_cast<int>((point.x / point.z) * fx + cx);
            int v = static_cast<int>((point.y / point.z) * fy + cy);

            if (u >= 0 && u < color_image_.cols && v >= 0 && v < color_image_.rows)
            {
                cv::Vec3b color = color_image_.at<cv::Vec3b>(v, u);
                uint32_t rgb = (static_cast<uint32_t>(color[2]) << 16 |
                                static_cast<uint32_t>(color[1]) << 8 |
                                static_cast<uint32_t>(color[0]));
                point_rgb.rgb = *reinterpret_cast<float *>(&rgb);
            }
            cloud_out->points[i] = point_rgb;
        }
    }
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "visualization_node");

    VisualizationNode visualization_node;

    ros::spin(); // Keep the node alive
    return 0;
}
