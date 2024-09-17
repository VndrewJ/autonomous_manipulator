// #include <recognize_objects.h>

// int
// main (int argc, char** argv)
// {
// 	int k = 6;
// 	double thresh = DBL_MAX;
// 	std::string model_dir = "data";
// 	std::string inputname = "input.pcd";
// 	std::vector<vfh_model> models;	
//   	flann::Matrix<int> k_indices;
//   	flann::Matrix<float> k_distances;

// 	if(argc<2) {
// 	PCL_ERROR("Usage: %s [-i <inputname>] [-m <model_dir>] [-k <neighbors>] [-t <threshold>]\n", argv[0]);
// 	return(-1);
// 	}
	
// 	// Parse console inputs
// 	pcl::console::parse_argument (argc, argv, "-i", inputname);
// 	pcl::console::parse_argument (argc, argv, "-m", model_dir);
// 	pcl::console::parse_argument (argc, argv, "-k", k);
// 	pcl::console::parse_argument (argc, argv, "-t", thresh);

//   	vfh_model histogram;
//   	std::string str = inputname;
// 	// Check if the query object has VFH signature, if not estimate signature and save it in a file
//   	if (!checkVFH(inputname))
//   	{
//       pcl::PointCloud <pcl::VFHSignature308> signature;
//       estimate_VFH(str, signature);
//       str.replace(str.find(".pcd"), 4, "_vfh.pcd");
//       pcl::io::savePCDFile (str, signature);
//   	}
// 	// Load VFH signature of the query object
//     if(!loadHist (str, histogram))
//   	{
//   	  pcl::console::print_error ("Cannot load test file %s\n", inputname);
//   	  return (-1);
//   	}
	
// 	// Load training data
// 	loadData(model_dir, models);

//   	// Convert data into FLANN format
//   	flann::Matrix<float> data (new float[models.size () * models[0].second.size ()], models.size (), models[0].second.size ());
	
//   	for (size_t i = 0; i < data.rows; ++i)
//   	  for (size_t j = 0; j < data.cols; ++j)
//   	    data[i][j] = models[i].second[j];

// 	// Place data in FLANN K-d tree
// 	flann::Index<flann::ChiSquareDistance<float> > index (data, flann::LinearIndexParams ());
// 	index.buildIndex ();
	
// 	// Search for query object in the K-d tree
// 	nearestKSearch (index, histogram, k, k_indices, k_distances);

// 	// Print closest candidates on the console
// 	std::cout << "The closest " << k << " neighbors for " << inputname << " are: " << std::endl;
//   	for (int i = 0; i < k; ++i)
//     	pcl::console::print_info ("    %d - %s (%d) with a distance of: %f\n", 
//         i, models.at (k_indices[0][i]).first.c_str (), k_indices[0][i], k_distances[0][i]);

// 	// Visualize closest candidates on the screen
// 	visualize(argc, argv, k, thresh, models, k_indices, k_distances);

// 	return 0;
// }

#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/io/pcd_io.h>
#include <pcl/features/vfh.h>
#include <pcl/features/normal_3d.h>
#include <pcl/search/kdtree.h>
#include <pcl/common/transforms.h>
#include <flann/flann.h>

// Model for storing the VFH features
typedef std::pair<std::string, pcl::PointCloud<pcl::VFHSignature308>::Ptr> vfh_model;
std::vector<vfh_model> models;

// Function to compute distance between VFH signatures
float computeDistance(const pcl::PointCloud<pcl::VFHSignature308>::Ptr& signature1, const pcl::PointCloud<pcl::VFHSignature308>::Ptr& signature2) {
    float distance = 0.0f;
    for (size_t i = 0; i < 308; ++i) {
        distance += pow(signature1->points[0].histogram[i] - signature2->points[0].histogram[i], 2);
    }
    return sqrt(distance);
}

// Function to find the nearest match in the model set
int nearestKSearch(const pcl::VFHSignature308& input_signature, const std::vector<vfh_model>& models) {
    int best_match_index = -1;
    float best_score = std::numeric_limits<float>::max();

    pcl::PointCloud<pcl::VFHSignature308>::Ptr input_signature_ptr(new pcl::PointCloud<pcl::VFHSignature308>);
    input_signature_ptr->push_back(input_signature);

    for (size_t i = 0; i < models.size(); ++i) {
        float distance = computeDistance(input_signature_ptr, models[i].second);
        if (distance < best_score) {
            best_score = distance;
            best_match_index = i;
        }
    }

    return best_match_index;
}

// Callback function to handle incoming point cloud from RealSense
void pointCloudCallback(const sensor_msgs::PointCloud2ConstPtr& cloud_msg)
{
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::fromROSMsg(*cloud_msg, *cloud);

    // Ensure the point cloud is not empty
    if (cloud->empty()) {
        ROS_WARN("Received an empty point cloud!");
        return;
    }

    // Compute normals
    pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> normal_estimation;
    pcl::PointCloud<pcl::Normal>::Ptr normals(new pcl::PointCloud<pcl::Normal>);
    normal_estimation.setInputCloud(cloud);
    pcl::search::KdTree<pcl::PointXYZ>::Ptr tree(new pcl::search::KdTree<pcl::PointXYZ>());
    normal_estimation.setSearchMethod(tree);
    normal_estimation.setRadiusSearch(0.05);
    normal_estimation.compute(*normals);

    // Compute VFH descriptor
    pcl::VFHEstimation<pcl::PointXYZ, pcl::Normal, pcl::VFHSignature308> vfh;
    vfh.setInputCloud(cloud);
    vfh.setInputNormals(normals);
    vfh.setSearchMethod(tree);
    pcl::PointCloud<pcl::VFHSignature308>::Ptr vfh_signature(new pcl::PointCloud<pcl::VFHSignature308>);
    vfh.compute(*vfh_signature);

    // Compare with training models
    vfh_model live_model;
    live_model.second = vfh_signature;
    int best_match = nearestKSearch(vfh_signature->points[0], models);  // Compare live VFH with pre-trained models

    if (best_match != -1) {
        ROS_INFO("Best match: %s", models[best_match].first.c_str());
    } else {
        ROS_WARN("No match found!");
    }
}

// Function to load the training data (VFH descriptors from .pcd files)
void loadModels(const std::string& model_dir, std::vector<vfh_model>& models)
{
    std::vector<std::string> model_files;  // Populate with model file paths
    pcl::PCLPointCloud2 cloud_blob;
    for (const auto& file : model_files) {
        pcl::PointCloud<pcl::VFHSignature308>::Ptr vfh_signature(new pcl::PointCloud<pcl::VFHSignature308>);
        if (pcl::io::loadPCDFile(file, *vfh_signature) == -1) {
            ROS_ERROR("Couldn't read file %s", file.c_str());
            continue;
        }
        models.emplace_back(file, vfh_signature);
        ROS_INFO("Loaded model %s", file.c_str());
    }
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "realsense_vfh_object_recognition");
    ros::NodeHandle nh;

    // Load pre-trained models from the directory
    std::string model_dir = "/path/to/training_data";
    loadModels(model_dir, models);

    // Subscribe to the RealSense point cloud topic
    ros::Subscriber sub = nh.subscribe("/camera/depth/points", 1, pointCloudCallback);

    ros::spin();
}
