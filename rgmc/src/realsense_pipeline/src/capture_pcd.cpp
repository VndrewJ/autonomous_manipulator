#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>
#include <librealsense2/rs.hpp>
#include <pcl/io/pcd_io.h>
#include <pcl/filters/passthrough.h>
#include <pcl/features/normal_3d.h>
#include <pcl/features/vfh.h>
#include <pcl/search/kdtree.h>
#include <pcl/segmentation/extract_clusters.h>
#include <sstream>
#include <ctime>
#include <fstream>
#include <boost/filesystem.hpp>

namespace fs = boost::filesystem;

std::string createDataDirectory(const std::string& base_directory) {
    std::time_t now = std::time(nullptr);
    std::tm* local_time = std::localtime(&now);

    // Create a timestamped directory name
    std::ostringstream dir_name;
    dir_name << base_directory << "/data_"
             << (local_time->tm_year + 1900) << '-' << (local_time->tm_mon + 1) << '-' << local_time->tm_mday
             << '_' << local_time->tm_hour << '-' << local_time->tm_min << '-' << local_time->tm_sec;

    // Create the directory
    fs::create_directories(dir_name.str());

    return dir_name.str();
}

std::string createClusterDirectory(const std::string& base_directory, int cluster_idx) {
    // Create a directory for each cluster
    std::ostringstream dir_name;
    dir_name << base_directory << "/cluster_" << cluster_idx;

    // Create the directory
    fs::create_directories(dir_name.str());

    return dir_name.str();
}

void savePointCloud(const pcl::PointCloud<pcl::PointXYZ>::Ptr& cloud, const std::string& directory, const std::string& base_filename) {
    std::ostringstream filename;
    filename << directory << "/point_cloud_" << base_filename << ".pcd";

    std::ofstream file(filename.str().c_str());
    if (file.is_open()) {
        // Write the PCD header
        file << "# .PCD v.7 - Point Cloud Data file format\n";
        file << "VERSION .7\n";
        file << "FIELDS x y z rgb u v vx vy vz normal_x normal_y normal_z curvature\n";
        file << "SIZE 4 4 4 4 4 4 4 4 4 4 4 4 4\n";
        file << "TYPE F F F F F F F F F F F F F\n";
        file << "COUNT 1 1 1 1 1 1 1 1 1 1 1 1 1\n";
        file << "WIDTH " << cloud->width << "\n";
        file << "HEIGHT " << cloud->height << "\n";
        file << "VIEWPOINT 0 0 0 1 0 0 0\n";
        file << "POINTS " << cloud->points.size() << "\n";
        file << "DATA ascii\n";

        // Write the point cloud data for the cluster
        for (const auto& point : cloud->points) {
            file << point.x << " " << point.y << " " << point.z << " "
                 << "0 " << "0 " << "0 " // Placeholder for rgb, u, v
                 << "0 " << "0 " << "0 " // Placeholder for vx, vy, vz
                 << "0 " << "0 " << "0 " // Placeholder for normal_x, normal_y, normal_z
                 << "0\n"; // Placeholder for curvature
        }

        file.close();
        ROS_INFO("Saved point cloud cluster to %s", filename.str().c_str());
    } else {
        ROS_ERROR("Could not open file %s for writing.", filename.str().c_str());
    }
}

void saveVFH(const pcl::PointCloud<pcl::VFHSignature308>::Ptr& vfhs, const std::string& directory, const std::string& base_filename) {
    std::ostringstream filename;
    filename << directory << "/point_cloud_" << base_filename << "_vfh.pcd";

    std::ofstream file(filename.str().c_str());
    if (file.is_open()) {
        // Write the PCD header
        file << "# .PCD v.6 - Point Cloud Data file format\n";
        file << "FIELDS vfh\n";
        file << "SIZE 4\n";
        file << "TYPE F\n";
        file << "COUNT 308\n";
        file << "WIDTH 1\n";
        file << "HEIGHT 1\n";
        file << "POINTS 1\n";
        file << "DATA ascii\n";

        // Write the VFH histogram data for the cluster
        for (const auto& vfh : vfhs->points) {
            for (int i = 0; i < 308; ++i) {
                file << vfh.histogram[i] << " ";
            }
            file << "\n";
        }

        file.close();
        ROS_INFO("Saved VFH features for cluster to %s", filename.str().c_str());
    } else {
        ROS_ERROR("Could not open file %s for writing.", filename.str().c_str());
    }
}

void extractAndSaveAllClusters(const pcl::PointCloud<pcl::PointXYZ>::Ptr& cloud, const std::string& base_directory, int frame_count) {
    pcl::search::KdTree<pcl::PointXYZ>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZ>);
    tree->setInputCloud(cloud);

    std::vector<pcl::PointIndices> cluster_indices;
    pcl::EuclideanClusterExtraction<pcl::PointXYZ> ec;
    ec.setClusterTolerance(0.025); // 2cm
    ec.setMinClusterSize(300);    // Minimum size for a cluster
    ec.setMaxClusterSize(30000);  // Maximum size for a cluster
    ec.setSearchMethod(tree);
    ec.setInputCloud(cloud);
    ec.extract(cluster_indices);

    if (cluster_indices.empty()) {
        ROS_WARN("No clusters found in the point cloud.");
        return;
    }

    int cluster_idx = 0;
    for (const auto& indices : cluster_indices) {
        // Extract each cluster and save it in a separate directory
        pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_cluster(new pcl::PointCloud<pcl::PointXYZ>);
        for (const auto& idx : indices.indices) {
            cloud_cluster->push_back((*cloud)[idx]);
        }
        cloud_cluster->width = cloud_cluster->size();
        cloud_cluster->height = 1;
        cloud_cluster->is_dense = true;

        // Create a directory for this cluster
        std::string cluster_directory = createClusterDirectory(base_directory, cluster_idx);
        std::string base_filename = "frame_" + std::to_string(frame_count) + "_cluster_" + std::to_string(cluster_idx);

        // Save the point cloud
        savePointCloud(cloud_cluster, cluster_directory, base_filename);

        // Compute and save VFH features for the cluster
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

    // Get the base data directory from parameters
    std::string base_directory;
    if (!nh.getParam("data_directory", base_directory)) {
        ROS_ERROR("Failed to get 'data_directory' parameter. Using default.");
        base_directory = "/tmp/pcl_pose_estimation_data";  // Default fallback directory
    }

    // Create a new data directory for this run
    std::string data_directory = createDataDirectory(base_directory);

    // Set up point cloud publisher
    ros::Publisher cloud_pub = nh.advertise<sensor_msgs::PointCloud2>("point_cloud", 10);

    // Set up RealSense pipeline
    rs2::pipeline pipe;
    rs2::config cfg;
    cfg.enable_stream(RS2_STREAM_DEPTH, 640, 480, RS2_FORMAT_Z16, 30);
    cfg.enable_stream(RS2_STREAM_COLOR, 640, 480, RS2_FORMAT_BGR8, 30);
    pipe.start(cfg);

    // Set up PCL visualizer
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

        // Apply a passthrough filter to remove points further than 2 meters
        pcl::PointCloud<pcl::PointXYZ>::Ptr filtered_cloud(new pcl::PointCloud<pcl::PointXYZ>);
        pcl::PassThrough<pcl::PointXYZ> pass;
        pass.setInputCloud(cloud);
        pass.setFilterFieldName("z");
        pass.setFilterLimits(0.0, 0.9);  // Keep points between 0 and 2 meters
        pass.filter(*filtered_cloud);

        // Apply Euclidean cluster extraction and save all clusters
        extractAndSaveAllClusters(filtered_cloud, data_directory, frame_count);

        // Publish and visualize the point cloud
        sensor_msgs::PointCloud2 cloud_msg;
        pcl::toROSMsg(*filtered_cloud, cloud_msg);
        cloud_msg.header.frame_id = "camera_frame";
        cloud_msg.header.stamp = ros::Time::now();
        cloud_pub.publish(cloud_msg);

        viewer->removeAllPointClouds();
        viewer->addPointCloud<pcl::PointXYZ>(filtered_cloud, "sample cloud");
        viewer->spinOnce(100);

        ROS_INFO("Clusters extracted and saved");

        loop_rate.sleep();
        frame_count++;
    }

    return 0;
}
