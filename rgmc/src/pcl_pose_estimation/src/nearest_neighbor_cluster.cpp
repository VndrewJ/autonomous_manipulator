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

typedef std::pair<std::string, std::vector<float> > vfh_model;

/** \brief Loads an n-D histogram file as a VFH signature
  * \param path the input file name
  * \param vfh the resultant VFH model
  */
bool loadHist(const pcl_fs::path &path, vfh_model &vfh)
{
  int vfh_idx;
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

std::string get_dir()
{
  std::string file_path = __FILE__;

  char dir_path[file_path.size() + 1];
  strcpy(dir_path, file_path.c_str());

  std::string current_dir = dirname(dir_path);

  size_t pos = current_dir.rfind("/src");

  if (pos != std::string::npos)
  {
    current_dir = current_dir.substr(0, pos);
    current_dir = current_dir + "/data/";
  }

  return current_dir;
}

int main(int argc, char **argv)
{
  std::string current_dir = get_dir();

  if (current_dir.empty())
  {
    std::cerr << "Error: Unable to get the current working directory" << std::endl;
    return (-1);
  }

  ros::init(argc, argv, "nearest_neighbor_node");
  ros::NodeHandle nh;

  int k = 6;
  double thresh = std::numeric_limits<double>::max();

  if (argc < 2)
  {
    pcl::console::print_error("Need at least three parameters! Syntax is: %s <query_vfh_model.pcd> [options] {kdtree.idx} {training_data.hdf5} {training_data.list}\n", argv[0]);
    pcl::console::print_info("    where [options] are:  -k      = number of nearest neighbors to search for in the tree (default: ");
    pcl::console::print_value("%d", k);
    pcl::console::print_info(")\n");
    pcl::console::print_info("                          -thresh = maximum distance threshold for a model to be considered VALID (default: ");
    pcl::console::print_value("%f", thresh);
    pcl::console::print_info(")\n\n");
    return (-1);
  }

  std::vector<int> pcd_indices = pcl::console::parse_file_extension_argument(argc, argv, ".pcd");
  vfh_model histogram;
  if (!loadHist(argv[pcd_indices.at(0)], histogram))
  {
    pcl::console::print_error("Cannot load test file %s\n", argv[pcd_indices.at(0)]);
    return (-1);
  }

  pcl::console::parse_argument(argc, argv, "-thresh", thresh);
  pcl::console::parse_argument(argc, argv, "-k", k);

  std::string kdtree_idx_file_name = current_dir + "kdtree.idx";
  std::string training_data_h5_file_name = current_dir + "training_data.hdf5";
  std::string training_data_list_file_name = current_dir + "training_data.list";

  std::vector<vfh_model> models;
  flann::Matrix<int> k_indices;
  flann::Matrix<float> k_distances;
  flann::Matrix<float> data;

  if (!pcl_fs::exists(training_data_h5_file_name) || !pcl_fs::exists(training_data_list_file_name))
  {
    pcl::console::print_error("Could not find training data models files %s and %s!\n",
                              training_data_h5_file_name.c_str(), training_data_list_file_name.c_str());
    return (-1);
  }
  else
  {
    loadFileList(models, training_data_list_file_name);
    flann::load_from_file(data, training_data_h5_file_name, "training_data");
    pcl::console::print_highlight("Training data found. Loaded %d VFH models from %s/%s.\n",
                                  (int)data.rows, training_data_h5_file_name.c_str(), training_data_list_file_name.c_str());
  }

  if (!pcl_fs::exists(kdtree_idx_file_name))
  {
    pcl::console::print_error("Could not find kd-tree index in file %s!", kdtree_idx_file_name.c_str());
    return (-1);
  }
  else
  {
    flann::Index<flann::ChiSquareDistance<float>> index(data, flann::SavedIndexParams(kdtree_idx_file_name));
    index.buildIndex();
    nearestKSearch(index, histogram, k, k_indices, k_distances);
  }

  pcl::console::print_highlight("The closest %d neighbors for %s are:\n", k, argv[pcd_indices[0]]);
  
  pcl::PointCloud<pcl::PointXYZ>::Ptr combined_cloud(new pcl::PointCloud<pcl::PointXYZ>);
  std::vector<Eigen::Vector4f> centroids;

  for (int i = 0; i < k; ++i)
  {
    pcl::console::print_info("    %d - %s (%d) with a distance of: %f\n",
                             i, models.at(k_indices[0][i]).first.c_str(), k_indices[0][i], k_distances[0][i]);

    std::string cloud_name = models.at(k_indices[0][i]).first;
    boost::replace_last(cloud_name, "_vfh", "");

    pcl::PCLPointCloud2 cloud;
    if (pcl::io::loadPCDFile(cloud_name, cloud) == -1)
      break;

    pcl::PointCloud<pcl::PointXYZ> cloud_xyz;
    pcl::fromPCLPointCloud2(cloud, cloud_xyz);

    if (cloud_xyz.size() == 0)
      break;

    *combined_cloud += cloud_xyz;

    Eigen::Vector4f centroid;
    pcl::compute3DCentroid(cloud_xyz, centroid);

    centroids.push_back(centroid);

    pcl::console::print_highlight("Cluster %d Centroid: [X: %f, Y: %f, Z: %f]\n", i,
                                  centroid[0], centroid[1], centroid[2]);
  }

  pcl::visualization::PCLVisualizer::Ptr viewer(new pcl::visualization::PCLVisualizer("Combined Point Cloud Viewer"));
  viewer->addPointCloud<pcl::PointXYZ>(combined_cloud, "combined_cloud");

  for (size_t i = 0; i < centroids.size(); ++i)
  {
    pcl::PointXYZ centroid_point(centroids[i][0], centroids[i][1], centroids[i][2]);
    viewer->addSphere(centroid_point, 0.05, 1.0, 0.0, 0.0, "centroid_sphere_" + std::to_string(i));
  }

  viewer->addCoordinateSystem(1.0);
  viewer->setBackgroundColor(0, 0, 0);
  viewer->spin();

  return 0;
}
