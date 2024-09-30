cmake_minimum_required(VERSION 3.0.2)
project(real_sense_alignment_pcl)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  pcl_ros
  pcl_conversions
  tf2_ros
  sensor_msgs
  std_msgs
)

find_package(PCL REQUIRED)
find_package(realsense2 REQUIRED PATHS /usr/local/lib/cmake/realsense2)

catkin_package(CATKIN_DEPENDS
  roscpp
  pcl_ros
  pcl_conversions
  tf2_ros
  sensor_msgs
  std_msgs
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
  ${realsense2_INCLUDE_DIRS} 
)

add_executable(real_sense_alignment_node src/real_sense_alignment.cpp)

target_link_libraries(real_sense_alignment_node
  ${catkin_LIBRARIES}
  ${PCL_LIBRARIES}
  ${realsense2_LIBRARY}  # Link the RealSense library
)

install(TARGETS real_sense_alignment_node
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
