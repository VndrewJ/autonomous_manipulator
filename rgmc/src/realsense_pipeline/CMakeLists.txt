cmake_minimum_required(VERSION 3.5)

cmake_policy(SET CMP0074 NEW) # Policy for <PackageName>_ROOT variables
cmake_policy(SET CMP0167 NEW) # Policy related to Boost find module

project(realsense_pipeline)

find_package(catkin REQUIRED COMPONENTS
  pcl_ros
  realsense2_camera
  roscpp
  sensor_msgs
  std_msgs
  message_generation
)

find_package(PCL 1.8 REQUIRED)  # Use the version that matches your installed PCL version
find_package(HDF5 REQUIRED)
find_package(FLANN REQUIRED)

# Find RealSense2 package
find_package(realsense2 REQUIRED)
find_package(Boost REQUIRED COMPONENTS filesystem)

add_message_files(
  FILES
  ClusterArray.msg
)

generate_messages(
  DEPENDENCIES
  sensor_msgs
  std_msgs
)

catkin_package(
  CATKIN_DEPENDS 
  roscpp pcl_ros 
  pcl_conversions 
  std_msgs
  message_runtime
  message_generation
)

include_directories(
  ${catkin_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
  ${HDF5_INCLUDE_DIR}
  ${Boost_INCLUDE_DIRS}
  ${realsense2_INCLUDE_DIRS}
)

# Add your executables
# Add your executables
add_executable(capture_node src/capture_pcd.cpp)
add_dependencies(capture_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(capture_node ${catkin_LIBRARIES} ${PCL_LIBRARIES} ${Boost_LIBRARIES} FLANN::FLANN ${HDF5_LIBRARIES} realsense2::realsense2)

add_executable(build_node src/build_tree.cpp)
add_dependencies(build_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(build_node ${catkin_LIBRARIES} ${PCL_LIBRARIES} ${Boost_LIBRARIES} FLANN::FLANN ${HDF5_LIBRARIES} realsense2::realsense2)

add_executable(clustering_node src/clustering.cpp)
add_dependencies(clustering_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(clustering_node ${catkin_LIBRARIES} ${PCL_LIBRARIES} ${Boost_LIBRARIES} FLANN::FLANN ${HDF5_LIBRARIES} realsense2::realsense2)

add_executable(neighbor_node src/nearest_neighbor.cpp)
add_dependencies(neighbor_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(neighbor_node ${catkin_LIBRARIES} ${PCL_LIBRARIES} ${Boost_LIBRARIES} FLANN::FLANN ${HDF5_LIBRARIES} realsense2::realsense2)

add_executable(original_neighbor src/original_neighbor.cpp)
add_dependencies(original_neighbor ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(original_neighbor ${catkin_LIBRARIES} ${PCL_LIBRARIES} ${Boost_LIBRARIES} FLANN::FLANN ${HDF5_LIBRARIES} realsense2::realsense2)

# Install targets
install(TARGETS build_node neighbor_node capture_node clustering_node original_neighbor
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
