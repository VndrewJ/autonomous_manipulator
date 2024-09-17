cmake_minimum_required(VERSION 3.0.2)
project(object_recognition_node)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  pcl_conversions
  pcl_ros
  roscpp
  sensor_msgs
  std_msgs
)

find_package(realsense2 REQUIRED PATHS /usr/local/lib/cmake/realsense2)

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)

find_package(PCL REQUIRED)

catkin_package(CATKIN_DEPENDS
	roscpp
	sensor_msgs
	std_msgs
	pcl_ros
	pcl_conversions
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
  ${realsense2_INCLUDE_DIRS} 
)

add_executable(object_recognition_node src/identify_object.cpp)

target_link_libraries(object_recognition_node 
  ${catkin_LIBRARIES}
  ${PCL_LIBRARIES}
  ${realsense2_LIBRARY}  # Link the RealSense library
)

install(TARGETS  object_recognition_node
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
