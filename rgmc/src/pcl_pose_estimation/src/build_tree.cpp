#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl/common/pcl_filesystem.h>
#include <pcl/console/print.h>
#include <pcl/io/pcd_io.h>

#include <flann/flann.h>
#include <flann/io/hdf5.h>
#include <fstream>
#include <iostream>

#include <ros/ros.h>

#include <libgen.h>  // For dirname()
#include <cstdio>    // For remove()

typedef std::pair<std::string, std::vector<float>> vfh_model;

// Function to delete a file if it exists
void deleteFileIfExists(const std::string &filename) {
    if (pcl_fs::exists(filename)) {
        if (remove(filename.c_str()) != 0) {
            std::cerr << "Error deleting file: " << filename << std::endl;
        } else {
            std::cout << "Deleted file: " << filename << std::endl;
        }
    }
}

/** \brief Loads an n-D histogram file as a VFH signature
  * \param path the input file name
  * \param vfh the resultant VFH model
  */
bool loadHist(const pcl_fs::path &path, vfh_model &vfh) {
    int vfh_idx;
    // Load the file as a PCD
    try {
        pcl::PCLPointCloud2 cloud;
        int version;
        Eigen::Vector4f origin;
        Eigen::Quaternionf orientation;
        pcl::PCDReader r;
        int type; unsigned int idx;
        r.readHeader(path.string(), cloud, origin, orientation, version, type, idx);

        vfh_idx = pcl::getFieldIndex(cloud, "vfh");
        if (vfh_idx == -1)
            return (false);
        if ((int)cloud.width * cloud.height != 1)
            return (false);
    } catch (const pcl::InvalidConversionException &) {
        return (false);
    }

    // Treat the VFH signature as a single Point Cloud
    pcl::PointCloud<pcl::VFHSignature308> point;
    pcl::io::loadPCDFile(path.string(), point);
    vfh.second.resize(308);

    std::vector<pcl::PCLPointField> fields;
    pcl::getFieldIndex<pcl::VFHSignature308>("vfh", fields);

    for (std::size_t i = 0; i < fields[vfh_idx].count; ++i) {
        vfh.second[i] = point[0].histogram[i];
    }
    vfh.first = path.string();
    return (true);
}

/** \brief Load a set of VFH features that will act as the model (training data)
  * \param argc the number of arguments (pass from main ())
  * \param argv the actual command line arguments (pass from main ())
  * \param extension the file extension containing the VFH features
  * \param models the resultant vector of histogram models
  */
void loadFeatureModels(const pcl_fs::path &base_dir, const std::string &extension,
                       std::vector<vfh_model> &models) {
    if (!pcl_fs::exists(base_dir) && !pcl_fs::is_directory(base_dir))
        return;

    for (pcl_fs::directory_iterator it(base_dir); it != pcl_fs::directory_iterator(); ++it) {
        if (pcl_fs::is_directory(it->status())) {
            std::stringstream ss;
            ss << it->path();
            pcl::console::print_highlight("Loading %s (%lu models loaded so far).\n", ss.str().c_str(), (unsigned long)models.size());
            loadFeatureModels(it->path(), extension, models);
        }
        if (pcl_fs::is_regular_file(it->status()) && it->path().extension().string() == extension) {
            vfh_model m;
            if (loadHist(base_dir / it->path().filename(), m))
                models.push_back(m);
        }
    }
}

std::string get_dir() {
    // The __FILE__ macro gives the full path of the current source file at compile time
    std::string file_path = __FILE__;

    // Allocate a buffer to store the directory path
    char dir_path[file_path.size() + 1];
    strcpy(dir_path, file_path.c_str());

    // Extract the directory name
    std::string current_dir = dirname(dir_path);

    // Find the position of "/src" in the directory path
    size_t pos = current_dir.rfind("/src");

    // If "/src" is found, remove everything from "/src" onwards
    if (pos != std::string::npos) {
        current_dir = current_dir.substr(0, pos);  // Trim the path to remove "/src" and beyond
        current_dir = current_dir + "/data/";
    }

    return current_dir;
}

int main(int argc, char **argv) {
    std::string current_dir = get_dir();

    if (current_dir.empty()) {
        std::cerr << "Error: Unable to get the current working directory" << std::endl;
        return (-1);
    }

    ros::init(argc, argv, "build_tree_node");
    ros::NodeHandle nh;

    if (argc < 1) {
        PCL_ERROR("Need at least one parameter! Syntax is: %s [model_directory] \n", argv[0]);
        return (-1);
    }

    std::string extension(".pcd");
    transform(extension.begin(), extension.end(), extension.begin(), (int(*)(int))tolower);

    std::string kdtree_idx_file_name = current_dir + "kdtree.idx";
    std::string training_data_h5_file_name = current_dir + "training_data.h5";
    std::string training_data_list_file_name = current_dir + "training_data.list";

    std::vector<vfh_model> models;

    // Load the model histograms
    loadFeatureModels(argv[1], extension, models);
    pcl::console::print_highlight("Loaded %d VFH models. Creating training data %s/%s.\n",
                                   (int)models.size(), training_data_h5_file_name.c_str(), training_data_list_file_name.c_str());

    // Delete existing files if they exist
    deleteFileIfExists(kdtree_idx_file_name);
    deleteFileIfExists(training_data_h5_file_name);
    deleteFileIfExists(training_data_list_file_name);

    // Convert data into FLANN format
    flann::Matrix<float> data(new float[models.size() * models[0].second.size()], models.size(), models[0].second.size());

    for (std::size_t i = 0; i < data.rows; ++i) {
        for (std::size_t j = 0; j < data.cols; ++j) {
            data[i][j] = models[i].second[j];
        }
    }

    // Save data to disk (list of models)
    flann::save_to_file(data, training_data_h5_file_name, "training_data");
    std::ofstream fs;
    fs.open(training_data_list_file_name.c_str());
    for (std::size_t i = 0; i < models.size(); ++i)
        fs << models[i].first << "\n";
    fs.close();

    // Build the tree index and save it to disk
    pcl::console::print_error("Building the kdtree index (%s) for %d elements...\n", kdtree_idx_file_name.c_str(), (int)data.rows);
    flann::Index<flann::ChiSquareDistance<float>> index(data, flann::LinearIndexParams());
    index.buildIndex();
    index.save(kdtree_idx_file_name);
    delete[] data.ptr();

    return (0);
}
