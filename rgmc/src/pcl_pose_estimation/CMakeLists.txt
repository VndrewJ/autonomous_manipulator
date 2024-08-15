cmake_minimum_required(VERSION 3.0.2)
project(pcl_pose_estimation)

# Find Catkin and PCL packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  pcl_ros
  pcl_conversions
  std_msgs
)

find_package(PCL 1.2 REQUIRED)
find_package(HDF5 REQUIRED)
find_package(FLANN REQUIRED)

catkin_package(
  CATKIN_DEPENDS roscpp pcl_ros pcl_conversions std_msgs
)

include_directories(
  ${catkin_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
  ${HDF5_INCLUDE_DIR}
)

# Add your executables
add_executable(build_tree_node src/build_tree.cpp)
target_link_libraries(build_tree_node ${catkin_LIBRARIES} ${PCL_LIBRARIES} ${Boost_LIBRARIES} FLANN::FLANN ${HDF5_LIBRARIES})

add_executable(nearest_neighbor_node src/nearest_neighbor.cpp)
target_link_libraries(nearest_neighbor_node ${catkin_LIBRARIES} ${PCL_LIBRARIES} ${Boost_LIBRARIES} FLANN::FLANN ${HDF5_LIBRARIES})

# Install targets
install(TARGETS build_tree_node nearest_neighbor_node
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
