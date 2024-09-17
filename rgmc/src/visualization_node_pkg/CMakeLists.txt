cmake_minimum_required(VERSION 3.0.2)
project(visualization_node_pkg)


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

add_executable(visualization_node_pkg src/visualization_node.cpp)

target_link_libraries(visualization_node_pkg 
  ${catkin_LIBRARIES}
  ${PCL_LIBRARIES}
  ${realsense2_LIBRARY}  # Link the RealSense library
)

install(TARGETS visualization_node_pkg
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)