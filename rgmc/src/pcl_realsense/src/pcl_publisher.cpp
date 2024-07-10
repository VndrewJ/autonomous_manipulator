#include <librealsense2/rs.hpp>
#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>

int main(int argc, char** argv) {
    ros::init(argc, argv, "pointcloud_reader_node");
    ros::NodeHandle nh;
    ros::Publisher pc_pub = nh.advertise<sensor_msgs::PointCloud2>("realsense/points", 10);

    rs2::pipeline pipe;
    rs2::config cfg;
    cfg.enable_stream(RS2_STREAM_DEPTH, RS2_FORMAT_Z16);
    cfg.enable_stream(RS2_STREAM_COLOR, RS2_FORMAT_BGR8);
    pipe.start(cfg);

    ros::Rate loop_rate(30);

    while (ros::ok()) {
        rs2::frameset frames = pipe.wait_for_frames();
        rs2::depth_frame depth_frame = frames.get_depth_frame();
        rs2::video_frame color_frame = frames.get_color_frame();

        // Cast to video_frame to access get_width() and get_height()
        rs2::video_frame depth_video_frame = depth_frame.as<rs2::video_frame>();

        int width = depth_video_frame.get_width();
        int height = depth_video_frame.get_height();

        pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);

        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                float dist = depth_frame.get_distance(x, y);
                if (dist > 0) {
                    pcl::PointXYZ point;
                    point.x = x;
                    point.y = y;
                    point.z = dist;
                    cloud->points.push_back(point);
                }
            }
        }

        sensor_msgs::PointCloud2 output;
        pcl::toROSMsg(*cloud, output);
        output.header.frame_id = "camera_link";
        pc_pub.publish(output);

        ros::spinOnce();
        loop_rate.sleep();
    }

    return 0;
}
