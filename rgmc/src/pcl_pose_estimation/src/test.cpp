#include <iostream>
#include <flann/flann.hpp>
#include <flann/io/hdf5.h>
#include <string>
#include <vector>

// Example function to create a directory (you can replace this with your actual implementation)
int create_directory(const std::string& path) {
    // Directory creation logic here
    return 0;
}

int main() {
    // Define your data matrix
    size_t num_rows = 100;  // Replace with actual number of rows
    size_t num_cols = 5;    // Replace with actual number of columns

    // Allocate and initialize matrix
    flann::Matrix<float> dataset(new float[num_rows * num_cols], num_rows, num_cols);

    // Fill the dataset with sample data (you should replace this with actual data)
    for (size_t i = 0; i < num_rows; ++i) {
        for (size_t j = 0; j < num_cols; ++j) {
            dataset[i][j] = static_cast<float>(i + j);
        }
    }

    // Define file paths and names
    std::string data_dir = "autonomous_manipulator/rgmc/src/pcl_pose_estimation/data";  // Replace with actual directory
    std::string training_data_hdf5_file_name = "src/pcl_pose_estimation/data/training_data.h5";

    // Create the directory if necessary (using your function)
    create_directory(data_dir);

    // Save the dataset to an HDF5 file
    try {
        flann::save_to_file(dataset, training_data_hdf5_file_name, "training_data");
        std::cout << "Data successfully saved to " << training_data_hdf5_file_name << std::endl;
    } catch (const std::exception& e) {
        std::cerr << "Error saving data: " << e.what() << std::endl;
    }

    // Clean up allocated memory
    delete[] dataset.ptr();

    return 0;
}

