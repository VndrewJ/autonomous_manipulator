// #include <ros/ros.h>
// #include <sensor_msgs/Image.h>
// #include <sensor_msgs/PointCloud2.h>
// #include <cv_bridge/cv_bridge.h>
// #include <pcl_ros/point_cloud.h>
// #include <pcl/point_types.h>
// #include <opencv2/opencv.hpp>

// typedef pcl::PointCloud<pcl::PointXYZRGB> PointCloud;

// void imageCallback(const sensor_msgs::ImageConstPtr& msg)
// {
//     try
//     {
//         cv::Mat cv_image = cv_bridge::toCvShare(msg, "bgr8")->image;
//         cv::imshow("Image Window", cv_image);
//         cv::waitKey(3);
//     }
//     catch (cv_bridge::Exception& e)
//     {
//         ROS_ERROR("cv_bridge exception: %s", e.what());
//     }
// }

// // void pointCloudCallback(const PointCloud::ConstPtr& cloud)
// // {
// //     ROS_INFO("Received point cloud with %lu points", cloud->points.size());
// // }

// void pointCloudCallback(const sensor_msgs::PointCloud2::ConstPtr& cloud_msg)
// {
//     // Process your point cloud data here
//     // Convert sensor_msgs::PointCloud2 to PCLPointCloud2
//     pcl::PCLPointCloud2 pcl_pc2;
//     pcl_conversions::toPCL(*cloud_msg, pcl_pc2);

//     // Convert to PCL point cloud type
//     pcl::PointCloud<pcl::PointXYZRGB> cloud;
//     pcl::fromPCLPointCloud2(pcl_pc2, cloud);

//     // Example: Print number of points
//     ROS_INFO("Received point cloud with %lu points", cloud.points.size());

//     // Add your processing code here
//     // Example: Loop through points
//     for (size_t i = 0; i < cloud.points.size(); ++i)
//     {
//         // Access x, y, z coordinates of each point
//         float x = cloud.points[i].x;
//         float y = cloud.points[i].y;
//         float z = cloud.points[i].z;

//         // Process the point data as needed

//         ROS_INFO("\nX = %f \nY = %f \nZ = %f", x, y, z);
//     }
// }

// int main(int argc, char** argv)
// {
//     ros::init(argc, argv, "realsense_node");
//     ros::NodeHandle nh;

//     ros::Subscriber image_sub = nh.subscribe("/camera/color/image_raw", 1, imageCallback);
//     ros::Subscriber point_cloud_sub = nh.subscribe("/camera/depth/color/points", 1, pointCloudCallback);

//     cv::namedWindow("Image Window");
//     ros::spin();
//     cv::destroyWindow("Image Window");

//     return 0;
// }


















#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/point_cloud2_iterator.h>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/highgui/highgui.hpp>

// Camera intrinsic parameters
struct CameraIntrinsics
{
    float fx, fy, cx, cy;
};

class RealSenseProcessor
{
public:
    RealSenseProcessor()
    {
        image_sub_ = nh_.subscribe("/camera/color/image_raw", 1, &RealSenseProcessor::imageCallback, this);
        pointcloud_sub_ = nh_.subscribe("/camera/depth/color/points", 1, &RealSenseProcessor::pointcloudCallback, this);

        // Example intrinsic parameters (these should be obtained from the camera calibration)
        intrinsics_ = {615.0f, 615.0f, 320.0f, 240.0f};
    }

    void imageCallback(const sensor_msgs::ImageConstPtr& msg)
    {
        try
        {
            cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
            image_ = cv_ptr->image;
        }
        catch (cv_bridge::Exception& e)
        {
            ROS_ERROR("cv_bridge exception: %s", e.what());
            return;
        }
    }

    void pointcloudCallback(const sensor_msgs::PointCloud2ConstPtr& msg)
    {
        pointcloud_ = msg;
        process();
    }

    void process()
    {
        if (image_.empty() || !pointcloud_)
        {
            return;
        }

        // Example: Project and draw the first 1000 points onto the image
        sensor_msgs::PointCloud2ConstIterator<float> iter_x(*pointcloud_, "x");
        sensor_msgs::PointCloud2ConstIterator<float> iter_y(*pointcloud_, "y");
        sensor_msgs::PointCloud2ConstIterator<float> iter_z(*pointcloud_, "z");

        for (size_t i = 0; i < pointcloud_->width && i < 1000; ++i, ++iter_x, ++iter_y, ++iter_z)
        {
            float x = *iter_x;
            float y = *iter_y;
            float z = *iter_z;

            if (z > 0)  // Ensure the point is in front of the camera
            {
                int u = static_cast<int>((x * intrinsics_.fx / z) + intrinsics_.cx);
                int v = static_cast<int>((y * intrinsics_.fy / z) + intrinsics_.cy);

                if (u >= 0 && u < image_.cols && v >= 0 && v < image_.rows)
                {
                    cv::circle(image_, cv::Point(u, v), 1, CV_RGB(255, 0, 0), -1);
                }
            }
        }

        // Display the image using OpenCV
        cv::imshow("RealSense Image with Projected Points", image_);
        cv::waitKey(1);
    }

private:
    ros::NodeHandle nh_;
    ros::Subscriber image_sub_;
    ros::Subscriber pointcloud_sub_;
    cv::Mat image_;
    sensor_msgs::PointCloud2ConstPtr pointcloud_;
    CameraIntrinsics intrinsics_;
};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "realsense_image_pointcloud_node");
    RealSenseProcessor processor;
    ros::spin();
    return 0;
}
