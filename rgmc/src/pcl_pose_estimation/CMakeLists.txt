cmake_minimum_required(VERSION 3.0.2)
project(pcl_pose_estimation)

# Find Catkin and PCL packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  pcl_ros
  pcl_conversions
  std_msgs
)

find_package(PCL 1.8 REQUIRED)  # Use the version that matches your installed PCL version
find_package(HDF5 REQUIRED)
find_package(FLANN REQUIRED)

# Find RealSense2 package
find_package(realsense2 REQUIRED)

catkin_package(
  CATKIN_DEPENDS roscpp pcl_ros pcl_conversions std_msgs
)

include_directories(
  ${catkin_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
  ${HDF5_INCLUDE_DIR}
  ${realsense2_INCLUDE_DIRS}
)

# Add your executables
add_executable(build_tree_node src/build_tree.cpp)
target_link_libraries(build_tree_node ${catkin_LIBRARIES} ${PCL_LIBRARIES} ${Boost_LIBRARIES} FLANN::FLANN ${HDF5_LIBRARIES})

add_executable(nearest_neighbor_node src/nearest_neighbor.cpp)
target_link_libraries(nearest_neighbor_node ${catkin_LIBRARIES} ${PCL_LIBRARIES} ${Boost_LIBRARIES} FLANN::FLANN ${HDF5_LIBRARIES})

# Add executable for capture_pcd
add_executable(capture_pcd_node src/capture_pcd.cpp)
target_link_libraries(capture_pcd_node ${catkin_LIBRARIES} ${PCL_LIBRARIES} ${Boost_LIBRARIES} FLANN::FLANN ${HDF5_LIBRARIES} ${realsense2_LIBRARY})

# Install targets
install(TARGETS build_tree_node nearest_neighbor_node capture_pcd_node
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
