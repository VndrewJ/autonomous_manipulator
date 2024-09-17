#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/io/vtk_lib_io.h>  // For loading STL files
#include <pcl/console/print.h>
#include <pcl/PolygonMesh.h>
#include <pcl/point_cloud.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/common/transforms.h>
#include <Eigen/Dense>
#include <ros/ros.h>
#include <pcl/filters/voxel_grid.h>

typedef pcl::PointXYZ PointT;
typedef pcl::PointCloud<PointT> PointCloudT;

// Function to convert STL file to Point Cloud
pcl::PointCloud<pcl::PointXYZ>::Ptr convertSTLToPointCloud(const std::string& stl_file) {
    pcl::PolygonMesh mesh;
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);

    // Load the STL file into a mesh
    if (pcl::io::loadPolygonFileSTL(stl_file, mesh) == -1) {
        pcl::console::print_error("Error loading STL file!\n");
        return nullptr;
    }

    // Convert mesh vertices to a point cloud
    pcl::fromPCLPointCloud2(mesh.cloud, *cloud);
    return cloud;
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "stl_to_pcd_converter");

    if (argc != 2) {
        pcl::console::print_error("Syntax is: %s object.stl\n", argv[0]);
        return -1;
    }

    // Load STL and convert to PCD
    pcl::console::print_highlight("Loading and converting STL file to point cloud...\n");
    pcl::PointCloud<pcl::PointXYZ>::Ptr object = convertSTLToPointCloud(argv[1]);

    if (!object || object->empty()) {
        pcl::console::print_error("Failed to convert STL to point cloud!\n");
        return -1;
    }

    // Downsample the point cloud (optional, depending on your needs)
    pcl::VoxelGrid<PointT> grid;
    grid.setLeafSize(0.000001f, 0.000001f, 0.000001f);  // Smaller leaf size for more points
    pcl::PointCloud<PointT>::Ptr object_downsampled(new pcl::PointCloud<PointT>);
    grid.setInputCloud(object);
    grid.filter(*object_downsampled);

    // Save the downsampled cloud as a PCD file
    pcl::io::savePCDFileASCII("object_converted.pcd", *object_downsampled);
    pcl::console::print_highlight("Saved the converted point cloud as object_converted.pcd\n");

    return 0;
}
