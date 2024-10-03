#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>
#include <librealsense2/rs.hpp>
#include <pcl/io/pcd_io.h>
#include <pcl/filters/passthrough.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/features/normal_3d.h>
#include <pcl/features/vfh.h>
#include <pcl/search/kdtree.h>
#include <pcl/segmentation/extract_clusters.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/filters/extract_indices.h>
#include <sstream>
#include <ctime>
#include <fstream>
#include <boost/filesystem.hpp>

namespace fs = boost::filesystem;

std::string createDataDirectory(const std::string& base_directory) {
    std::time_t now = std::time(nullptr);
    std::tm* local_time = std::localtime(&now);

    std::ostringstream dir_name;
    dir_name << base_directory << "/data_"
             << (local_time->tm_year + 1900) << '-' << (local_time->tm_mon + 1) << '-' << local_time->tm_mday
             << '_' << local_time->tm_hour << '-' << local_time->tm_min << '-' << local_time->tm_sec;

    fs::create_directories(dir_name.str());
    return dir_name.str();
}

std::string createClusterDirectory(const std::string& base_directory, int cluster_idx) {
    std::ostringstream dir_name;
    dir_name << base_directory << "/cluster_" << cluster_idx;

    fs::create_directories(dir_name.str());
    return dir_name.str();
}

void savePointCloud(const pcl::PointCloud<pcl::PointXYZ>::Ptr& cloud, const std::string& directory, const std::string& base_filename) {
    std::ostringstream filename;
    filename << directory << "/point_cloud_" << base_filename << ".pcd";

    if (pcl::io::savePCDFileASCII(filename.str(), *cloud) == 0) {
        ROS_INFO("Saved point cloud cluster to %s", filename.str().c_str());
    } else {
        ROS_ERROR("Could not save point cloud to %s.", filename.str().c_str());
    }
}

void saveVFH(const pcl::PointCloud<pcl::VFHSignature308>::Ptr& vfhs, const std::string& directory, const std::string& base_filename) {
    std::ostringstream filename;
    filename << directory << "/point_cloud_" << base_filename << "_vfh.pcd";

    if (pcl::io::savePCDFileASCII(filename.str(), *vfhs) == 0) {
        ROS_INFO("Saved VFH features for cluster to %s", filename.str().c_str());
    } else {
        ROS_ERROR("Could not save VFH features to %s.", filename.str().c_str());
    }
}

void extractAndSaveAllClusters(const pcl::PointCloud<pcl::PointXYZ>::Ptr& cloud, const std::string& base_directory, int frame_count) {
    pcl::search::KdTree<pcl::PointXYZ>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZ>);
    tree->setInputCloud(cloud);

    std::vector<pcl::PointIndices> cluster_indices;
    pcl::EuclideanClusterExtraction<pcl::PointXYZ> ec;
    ec.setClusterTolerance(0.03);  // Increased to 3cm to include more points
    ec.setMinClusterSize(100);     // Reduced minimum cluster size for smaller objects
    ec.setMaxClusterSize(1000);
    ec.setSearchMethod(tree);
    ec.setInputCloud(cloud);
    ec.extract(cluster_indices);

    if (cluster_indices.empty()) {
        ROS_WARN("No clusters found in the point cloud.");
        return;
    }

    int cluster_idx = 0;
    for (const auto& indices : cluster_indices) {
        pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_cluster(new pcl::PointCloud<pcl::PointXYZ>);
        for (const auto& idx : indices.indices) {
            cloud_cluster->push_back((*cloud)[idx]);
        }
        cloud_cluster->width = cloud_cluster->size();
        cloud_cluster->height = 1;
        cloud_cluster->is_dense = true;

        std::string cluster_directory = createClusterDirectory(base_directory, cluster_idx);
        std::string base_filename = "frame_" + std::to_string(frame_count) + "_cluster_" + std::to_string(cluster_idx);

        savePointCloud(cloud_cluster, cluster_directory, base_filename);

        pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> normal_estimation;
        pcl::search::KdTree<pcl::PointXYZ>::Ptr tree_normal(new pcl::search::KdTree<pcl::PointXYZ>);
        normal_estimation.setInputCloud(cloud_cluster);
        normal_estimation.setSearchMethod(tree_normal);
        pcl::PointCloud<pcl::Normal>::Ptr cloud_normals(new pcl::PointCloud<pcl::Normal>);
        normal_estimation.setKSearch(50);
        normal_estimation.compute(*cloud_normals);

        pcl::VFHEstimation<pcl::PointXYZ, pcl::Normal, pcl::VFHSignature308> vfh;
        vfh.setInputCloud(cloud_cluster);
        vfh.setInputNormals(cloud_normals);
        pcl::PointCloud<pcl::VFHSignature308>::Ptr vfhs(new pcl::PointCloud<pcl::VFHSignature308>);
        vfh.compute(*vfhs);

        saveVFH(vfhs, cluster_directory, base_filename);

        ROS_INFO("Cluster %d extracted and saved.", cluster_idx);
        cluster_idx++;
    }
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "capture_pcd_node");
    ros::NodeHandle nh("~");

    std::string base_directory;
    if (!nh.getParam("data_directory", base_directory)) {
        ROS_ERROR("Failed to get 'data_directory' parameter. Using default.");
        base_directory = "/tmp/pcl_pose_estimation_data";
    }

    std::string data_directory = createDataDirectory(base_directory);

    ros::Publisher cloud_pub = nh.advertise<sensor_msgs::PointCloud2>("point_cloud", 10);

    rs2::pipeline pipe;
    rs2::config cfg;
    cfg.enable_stream(RS2_STREAM_DEPTH, 640, 480, RS2_FORMAT_Z16, 30);
    cfg.enable_stream(RS2_STREAM_COLOR, 640, 480, RS2_FORMAT_BGR8, 30);
    pipe.start(cfg);

    pcl::visualization::PCLVisualizer::Ptr viewer(new pcl::visualization::PCLVisualizer("PointCloud Viewer"));
    viewer->setBackgroundColor(0, 0, 0);
    viewer->addCoordinateSystem(1.0);
    viewer->initCameraParameters();

    ros::Rate loop_rate(10);
    int frame_count = 0;

    while (ros::ok() && !viewer->wasStopped()) {
        rs2::frameset frames = pipe.wait_for_frames();
        rs2::depth_frame depth = frames.get_depth_frame();
        rs2::pointcloud pc;
        rs2::points points = pc.calculate(depth);

        pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);

        auto vertices = points.get_vertices();
        for (int i = 0; i < points.size(); ++i) {
            if (vertices[i].z) {
                cloud->points.push_back(pcl::PointXYZ(vertices[i].x, vertices[i].y, vertices[i].z));
            }
        }

        cloud->width = static_cast<uint32_t>(cloud->points.size());
        cloud->height = 1;
        cloud->is_dense = false;

        // Apply a PassThrough filter to limit depth range
        pcl::PassThrough<pcl::PointXYZ> pass;
        pass.setInputCloud(cloud);
        pass.setFilterFieldName("z");
        pass.setFilterLimits(0.0, 0.8);  // Only keep points within 2 meters
        pass.filter(*cloud);

        // Plane segmentation to remove dominant plane
        pcl::SACSegmentation<pcl::PointXYZ> seg;
        pcl::ExtractIndices<pcl::PointXYZ> extract;

        seg.setModelType(pcl::SACMODEL_PLANE);
        seg.setMethodType(pcl::SAC_RANSAC);
        seg.setDistanceThreshold(0.01);  // 1cm threshold for fitting the plane
        seg.setInputCloud(cloud);

        pcl::PointIndices::Ptr inliers(new pcl::PointIndices);
        pcl::ModelCoefficients::Ptr coefficients(new pcl::ModelCoefficients);
        seg.segment(*inliers, *coefficients);

        if (!inliers->indices.empty()) {
            extract.setInputCloud(cloud);
            extract.setIndices(inliers);
            extract.setNegative(true);  // Remove the plane
            extract.filter(*cloud);
            ROS_INFO("Plane removed, remaining points: %ld", cloud->points.size());
        } else {
            ROS_WARN("No plane found to remove.");
        }

        // Apply a VoxelGrid filter for smoothing after plane removal
        pcl::VoxelGrid<pcl::PointXYZ> sor;
        sor.setInputCloud(cloud);
        sor.setLeafSize(0.005f, 0.005f, 0.005f);  // Set the voxel size for less aggressive downsizing
        sor.filter(*cloud);

        // Extract and save clusters
        extractAndSaveAllClusters(cloud, data_directory, frame_count);

        // Publish and visualize the point cloud after all filtering and processing
        sensor_msgs::PointCloud2 cloud_msg;
        pcl::toROSMsg(*cloud, cloud_msg);
        cloud_msg.header.frame_id = "camera_frame";
        cloud_msg.header.stamp = ros::Time::now();
        cloud_pub.publish(cloud_msg);

        viewer->removeAllPointClouds();
        viewer->addPointCloud<pcl::PointXYZ>(cloud, "filtered cloud");
        viewer->spinOnce(100);

        loop_rate.sleep();
        frame_count++;
    }

    return 0;
}
