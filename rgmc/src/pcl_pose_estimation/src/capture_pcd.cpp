#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>
#include <librealsense2/rs.hpp>
#include <pcl/io/pcd_io.h>
#include <pcl/filters/passthrough.h>
#include <pcl/features/normal_3d.h>
#include <pcl/features/vfh.h>
#include <pcl/search/kdtree.h>
#include <sstream>
#include <ctime>
#include <fstream>

std::string getDataDirectory(ros::NodeHandle& nh) {
    std::string data_directory;
    if (!nh.getParam("data_directory", data_directory)) {
        ROS_ERROR("Failed to get 'data_directory' parameter. Using default.");
        data_directory = "/tmp/pcl_pose_estimation_data";  // Default fallback directory
    }
    return data_directory;
}

void savePointCloud(const pcl::PointCloud<pcl::PointXYZ>::Ptr& cloud, const std::string& directory) {
    // Get current time
    std::time_t now = std::time(nullptr);
    std::tm* local_time = std::localtime(&now);

    // Create a timestamped filename
    std::ostringstream filename;
    filename << directory << "/point_cloud_"
             << (local_time->tm_year + 1900) << '-' << (local_time->tm_mon + 1) << '-' << local_time->tm_mday
             << '_' << local_time->tm_hour << '-' << local_time->tm_min << '-' << local_time->tm_sec
             << ".pcd";

    // Save the point cloud data to a PCD file
    pcl::io::savePCDFileASCII(filename.str(), *cloud);
    ROS_INFO("Saved point cloud to %s", filename.str().c_str());
}

void saveVFH(const pcl::PointCloud<pcl::VFHSignature308>::Ptr& vfhs, const std::string& directory) {
    // Get current time
    std::time_t now = std::time(nullptr);
    std::tm* local_time = std::localtime(&now);

    // Create a timestamped filename for VFH
    std::ostringstream filename;
    filename << directory << "/vfh_features_"
             << (local_time->tm_year + 1900) << '-' << (local_time->tm_mon + 1) << '-' << local_time->tm_mday
             << '_' << local_time->tm_hour << '-' << local_time->tm_min << '-' << local_time->tm_sec
             << ".txt";

    // Save the VFH features to a text file
    std::ofstream file(filename.str().c_str());
    if (file.is_open()) {
        for (const auto& vfh : vfhs->points) {
            for (int i = 0; i < 308; ++i) {
                file << vfh.histogram[i] << " ";
            }
            file << "\n";
        }
        file.close();
        ROS_INFO("Saved VFH features to %s", filename.str().c_str());
    } else {
        ROS_ERROR("Could not open file %s for writing.", filename.str().c_str());
    }
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "capture_pcd_node");
    ros::NodeHandle nh("~");  // Use private node handle to get parameters

    // Get the data directory from parameters
    std::string data_directory = getDataDirectory(nh);

    ros::Publisher cloud_pub = nh.advertise<sensor_msgs::PointCloud2>("point_cloud", 10);

    rs2::pipeline pipe;
    rs2::config cfg;
    cfg.enable_stream(RS2_STREAM_DEPTH, 640, 480, RS2_FORMAT_Z16, 30);
    cfg.enable_stream(RS2_STREAM_COLOR, 640, 480, RS2_FORMAT_BGR8, 30);
    pipe.start(cfg);

    ros::Rate loop_rate(10);

    while (ros::ok()) {
        rs2::frameset frames = pipe.wait_for_frames();
        rs2::depth_frame depth = frames.get_depth_frame();
        rs2::pointcloud pc;
        rs2::points points = pc.calculate(depth);

        pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
        pcl::PointCloud<pcl::Normal>::Ptr normals(new pcl::PointCloud<pcl::Normal>);

        auto vertices = points.get_vertices();
        for (int i = 0; i < points.size(); ++i) {
            if (vertices[i].z) {
                cloud->points.push_back(pcl::PointXYZ(vertices[i].x, vertices[i].y, vertices[i].z));
            }
        }

        cloud->width = (uint32_t)cloud->points.size();
        cloud->height = 1;
        cloud->is_dense = false;

        // Compute normals
        pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> normal_estimation;
        pcl::search::KdTree<pcl::PointXYZ>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZ>);
        normal_estimation.setInputCloud(cloud);
        normal_estimation.setSearchMethod(tree);
        pcl::PointCloud<pcl::Normal>::Ptr cloud_normals(new pcl::PointCloud<pcl::Normal>);
        normal_estimation.setKSearch(50);  // Number of nearest neighbors to use for normal estimation
        normal_estimation.compute(*cloud_normals);

        // Compute VFH features
        pcl::VFHEstimation<pcl::PointXYZ, pcl::Normal, pcl::VFHSignature308> vfh;
        vfh.setInputCloud(cloud);
        vfh.setInputNormals(cloud_normals);
        pcl::search::KdTree<pcl::PointXYZ>::Ptr vfh_tree(new pcl::search::KdTree<pcl::PointXYZ>);
        vfh.setSearchMethod(vfh_tree);
        pcl::PointCloud<pcl::VFHSignature308>::Ptr vfhs(new pcl::PointCloud<pcl::VFHSignature308>);
        vfh.compute(*vfhs);

        // Save point cloud and VFH features
        savePointCloud(cloud, data_directory);
        saveVFH(vfhs, data_directory);

        sensor_msgs::PointCloud2 cloud_msg;
        pcl::toROSMsg(*cloud, cloud_msg);
        cloud_msg.header.frame_id = "camera_frame";
        cloud_msg.header.stamp = ros::Time::now();

        cloud_pub.publish(cloud_msg);

        ROS_INFO("Point cloud published and VFH features saved");

        loop_rate.sleep();
    }

    return 0;
}
