#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl/common/common.h>
#include <pcl/common/centroid.h> // for compute3DCentroid
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/common/pcl_filesystem.h>
#include <pcl/console/parse.h>
#include <pcl/console/print.h>
#include <pcl/io/pcd_io.h>
#include <iostream>
#include <limits>
#include <flann/flann.h>
#include <flann/io/hdf5.h>

#include <ros/ros.h>

#include <boost/algorithm/string/replace.hpp> // for replace_last
#include <libgen.h>  // For dirname()

#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <realsense_pipeline/ClusterArray.h>  // Include the custom message

#include <pcl/features/vfh.h>            // For VFHEstimation
#include <pcl/features/normal_3d.h>      // For NormalEstimation
#include <pcl/search/kdtree.h>           // For KdTree
#include <pcl/features/pfh.h>            // (Optional) Include for PFH feature extraction if used

#include <thread>  // For running the visualizer in a separate thread


typedef std::pair<std::string, std::vector<float> > vfh_model;

std::vector<vfh_model> models;
flann::Index<flann::ChiSquareDistance<float>>* index_ptr = nullptr;  // Pointer to hold the kd-tree index

boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer;

/** \brief Loads an n-D histogram file as a VFH signature
  * \param path the input file name
  * \param vfh the resultant VFH model
  */
bool loadHist(const pcl_fs::path &path, vfh_model &vfh)
{
  int vfh_idx;
  // Load the file as a PCD
  try
  {
    pcl::PCLPointCloud2 cloud;
    int version;
    Eigen::Vector4f origin;
    Eigen::Quaternionf orientation;
    pcl::PCDReader r;
    int type;
    unsigned int idx;
    r.readHeader(path.string(), cloud, origin, orientation, version, type, idx);

    vfh_idx = pcl::getFieldIndex(cloud, "vfh");
    if (vfh_idx == -1)
      return (false);
    if ((int)cloud.width * cloud.height != 1)
      return (false);
  }
  catch (const pcl::InvalidConversionException &)
  {
    return (false);
  }

  // Treat the VFH signature as a single Point Cloud
  pcl::PointCloud<pcl::VFHSignature308> point;
  pcl::io::loadPCDFile(path.string(), point);
  vfh.second.resize(308);

  std::vector<pcl::PCLPointField> fields;
  pcl::getFieldIndex<pcl::VFHSignature308>("vfh", fields);

  for (std::size_t i = 0; i < fields[vfh_idx].count; ++i)
  {
    vfh.second[i] = point[0].histogram[i];
  }
  vfh.first = path.string();
  return (true);
}

/** \brief Search for the closest k neighbors
  * \param index the tree
  * \param model the query model
  * \param k the number of neighbors to search for
  * \param indices the resultant neighbor indices
  * \param distances the resultant neighbor distances
  */
inline void nearestKSearch(flann::Index<flann::ChiSquareDistance<float>> &index, const vfh_model &model,
                           int k, flann::Matrix<int> &indices, flann::Matrix<float> &distances)
{
  // Query point
  flann::Matrix<float> p = flann::Matrix<float>(new float[model.second.size()], 1, model.second.size());
  memcpy(&p.ptr()[0], &model.second[0], p.cols * p.rows * sizeof(float));

  indices = flann::Matrix<int>(new int[k], 1, k);
  distances = flann::Matrix<float>(new float[k], 1, k);
  index.knnSearch(p, indices, distances, k, flann::SearchParams(512));
  delete[] p.ptr();
}

/** \brief Load the list of file model names from an ASCII file
  * \param models the resultant list of model name
  * \param filename the input file name
  */
bool loadFileList(std::vector<vfh_model> &models, const std::string &filename)
{
  std::ifstream fs;
  fs.open(filename.c_str());
  if (!fs.is_open() || fs.fail())
    return (false);

  std::string line;
  while (!fs.eof())
  {
    std::getline(fs, line);
    if (line.empty())
      continue;
    vfh_model m;
    m.first = line;
    models.push_back(m);
  }
  fs.close();
  return (true);
}
std::string get_dir() {
    std::string file_path = __FILE__;
    char dir_path[file_path.size() + 1];
    strcpy(dir_path, file_path.c_str());
    std::string current_dir = dirname(dir_path);
    size_t pos = current_dir.rfind("/src");
    if (pos != std::string::npos) {
        current_dir = current_dir.substr(0, pos);
        current_dir = current_dir + "/data/";
    }
    return current_dir;
}

void visualizeCluster(const pcl::PointCloud<pcl::PointXYZ>::Ptr &cluster, const std::string &cluster_id) {
    viewer->removeAllPointClouds(); // Remove existing point clouds

    pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> cluster_color(cluster, 0, 255, 0); // Green color
    viewer->addPointCloud<pcl::PointXYZ>(cluster, cluster_color, cluster_id);

    // Add some visual features
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 3, cluster_id);
    viewer->setBackgroundColor(0, 0, 0); // Set background to black
    viewer->spinOnce();
}

void clustersCallback(const realsense_pipeline::ClusterArray::ConstPtr &clusters_msg) {
    if (index_ptr == nullptr) {
        ROS_ERROR("Index is not initialized");
        return;
    }

    for (const auto &cluster_msg : clusters_msg->clusters) {
        pcl::PointCloud<pcl::PointXYZ>::Ptr cluster(new pcl::PointCloud<pcl::PointXYZ>);
        pcl::fromROSMsg(cluster_msg, *cluster);

        // Step 1: Compute Normals for the Cluster
        pcl::PointCloud<pcl::Normal>::Ptr normals(new pcl::PointCloud<pcl::Normal>);
        pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> ne;
        pcl::search::KdTree<pcl::PointXYZ>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZ>());
        ne.setInputCloud(cluster);
        ne.setSearchMethod(tree);
        ne.setRadiusSearch(0.05);
        ne.compute(*normals);

        // Step 2: Compute VFH Features for the Cluster
        pcl::PointCloud<pcl::VFHSignature308>::Ptr cluster_vfh(new pcl::PointCloud<pcl::VFHSignature308>);
        pcl::VFHEstimation<pcl::PointXYZ, pcl::Normal, pcl::VFHSignature308> vfh;
        vfh.setInputCloud(cluster);
        vfh.setInputNormals(normals);
        pcl::search::KdTree<pcl::PointXYZ>::Ptr vfh_tree(new pcl::search::KdTree<pcl::PointXYZ>());
        vfh.setSearchMethod(vfh_tree);
        vfh.compute(*cluster_vfh);

        vfh_model test_model;
        test_model.second.resize(308);
        for (size_t i = 0; i < 308; ++i) {
            test_model.second[i] = cluster_vfh->points[0].histogram[i];
        }

        // Perform nearest neighbor search
        int k = 5;  // Number of nearest neighbors to find
        flann::Matrix<int> k_indices(new int[k], 1, k);
        flann::Matrix<float> k_distances(new float[k], 1, k);
        nearestKSearch(*index_ptr, test_model, k, k_indices, k_distances);

        // Output the results on screen
        for (int i = 0; i < k; ++i) {
            if (k_indices[0][i] < models.size()) {
                ROS_INFO("Cluster %d identified as: %s with a distance of: %f", 
                         i, models.at(k_indices[0][i]).first.c_str(), k_distances[0][i]);
            } else {
                ROS_WARN("Index %d out of bounds for models vector", k_indices[0][i]);
            }
        }

        // Calculate and print the centroid of the cluster
        Eigen::Vector4f centroid;
        pcl::compute3DCentroid(*cluster, centroid);
        ROS_INFO("Centroid of identified cluster: [X: %f, Y: %f, Z: %f]",
                 centroid[0], centroid[1], centroid[2]);

        // Visualize the identified cluster
        visualizeCluster(cluster, "identified_cluster");

        delete[] k_indices.ptr();
        delete[] k_distances.ptr();
    }
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "nearest_neighbor_node");
    ros::NodeHandle nh;

    // Create a PCLVisualizer in a separate thread
    viewer = boost::make_shared<pcl::visualization::PCLVisualizer>("Cluster Viewer");
    viewer->setCameraPosition(0, 0, -2, 0, -1, 0);  // Set an initial camera position

    std::thread visualizer_thread([]() {
        while (!viewer->wasStopped()) {
            viewer->spinOnce(100);
            std::this_thread::sleep_for(std::chrono::milliseconds(100));
        }
    });

    std::string current_dir = get_dir();
    if (current_dir.empty()) {
        ROS_ERROR("Unable to get the current working directory");
        return (-1);
    }

    std::string training_data_h5_file_name = current_dir + "training_data.h5";
    std::string training_data_list_file_name = current_dir + "training_data.list";
    std::string kdtree_idx_file_name = current_dir + "kdtree.idx";

    if (!pcl_fs::exists(training_data_h5_file_name) || !pcl_fs::exists(training_data_list_file_name)) {
        ROS_ERROR("Could not find training data models files: %s and %s",
                  training_data_h5_file_name.c_str(), training_data_list_file_name.c_str());
        return (-1);
    }

    loadFileList(models, training_data_list_file_name);
    flann::Matrix<float> data;
    flann::load_from_file(data, training_data_h5_file_name, "training_data");

    if (data.rows == 0 || data.cols == 0) {
        ROS_ERROR("Failed to load training data. Data matrix is empty.");
        return (-1);
    }

    index_ptr = new flann::Index<flann::ChiSquareDistance<float>>(data, flann::SavedIndexParams(kdtree_idx_file_name));
    index_ptr->buildIndex();

    if (index_ptr == nullptr) {
        ROS_ERROR("Failed to initialize the FLANN index.");
        return (-1);
    }

    ros::Subscriber sub = nh.subscribe<realsense_pipeline::ClusterArray>("clusters", 1, clustersCallback);
    ros::spin();

    // Clean up after ros::spin()
    viewer->close();
    visualizer_thread.join();
    delete index_ptr;

    return 0;
}