#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>
#include <librealsense2/rs.hpp>

class PCD_Capture_Node
{
public:
    PCD_Capture_Node()
    {
        // Initialize RealSense pipeline
        pipeline.start();

        // ROS publisher
        pub_ = nh_.advertise<sensor_msgs::PointCloud2>("point_cloud", 1);

        // Timer to capture data periodically
        timer_ = nh_.createTimer(ros::Duration(1.0), &PCD_Capture_Node::captureAndPublish, this);
    }

private:
    void captureAndPublish(const ros::TimerEvent&)
    {
        rs::frameset frames = pipeline.wait_for_frames();
        rs::frame depth = frames.get_depth_frame();

        // Convert RealSense depth frame to PCL PointCloud
        pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
        for (int y = 0; y < depth.get_height(); y++)
        {
            for (int x = 0; x < depth.get_width(); x++)
            {
                float z = depth.get_distance(x, y);
                if (z > 0)
                {
                    pcl::PointXYZ point;
                    point.x = x * z;
                    point.y = y * z;
                    point.z = z;
                    cloud->points.push_back(point);
                }
            }
        }

        cloud->width = cloud->points.size();
        cloud->height = 1;
        cloud->is_dense = false;

        // Convert to ROS message
        sensor_msgs::PointCloud2 ros_cloud;
        pcl::toROSMsg(*cloud, ros_cloud);
        ros_cloud.header.frame_id = "camera_link";
        pub_.publish(ros_cloud);

        // Save the point cloud to a PCD file
        pcl::io::savePCDFileASCII("captured_data.pcd", *cloud);
    }

    ros::NodeHandle nh_;
    ros::Publisher pub_;
    ros::Timer timer_;
    rs::pipeline pipeline;
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "capture_pcd_node");
    PCD_Capture_Node node;
    ros::spin();
    return 0;
}
