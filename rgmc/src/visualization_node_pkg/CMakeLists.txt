cmake_minimum_required(VERSION 3.0.2)
project(visualization_node_pkg)


find_package(catkin REQUIRED COMPONENTS
  pcl_conversions
  pcl_ros
  roscpp
  sensor_msgs
  std_msgs
  cv_bridge
  image_transport
)

find_package(PCL REQUIRED)
find_package(realsense2 REQUIRED PATHS /usr/local/lib/cmake/realsense2)
find_package(OpenCV REQUIRED)


catkin_package(CATKIN_DEPENDS
	roscpp
	sensor_msgs
	std_msgs
	pcl_ros
	pcl_conversions
  cv_bridge
  image_transport
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
  ${realsense2_INCLUDE_DIRS} 
  ${OpenCV_INCLUDE_DIRS}
)

add_executable(visualization_node src/visualization_node.cpp)

target_link_libraries(visualization_node 
  ${catkin_LIBRARIES}
  ${PCL_LIBRARIES}
  ${realsense2_LIBRARY}  # Link the RealSense library
  ${OpenCV_LIBS}
)

install(TARGETS visualization_node
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)