cmake_minimum_required(VERSION 3.0.2)
project(robust_pose_estimation_pcl)

find_package(catkin REQUIRED COMPONENTS
  pcl_conversions
  pcl_ros
  roscpp
  sensor_msgs
  std_msgs
)

find_package(PCL REQUIRED)
find_package(realsense2 REQUIRED PATHS /usr/local/lib/cmake/realsense2)

catkin_package(CATKIN_DEPENDS
	roscpp
	sensor_msgs
	std_msgs
	pcl_ros
	pcl_conversions
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
  ${realsense2_INCLUDE_DIRS} 
)

add_executable(alignment_prerejective src/alignment_prerejective.cpp)

target_link_libraries(alignment_prerejective 
  ${catkin_LIBRARIES}
  ${PCL_LIBRARIES}
  ${realsense2_LIBRARY}  # Link the RealSense library
)

install(TARGETS alignment_prerejective
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)