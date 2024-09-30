cmake_minimum_required(VERSION 3.0.2)
project(pointcloud_filter_testing)

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


add_executable(pointcloud_filter_node src/filter_pcd.cpp)
add_executable(pointcloud_filter_publisher src/filter_pcd_publisher.cpp)

target_link_libraries(pointcloud_filter_node 
  ${catkin_LIBRARIES}
  ${PCL_LIBRARIES}
  ${realsense2_LIBRARY}  # Link the RealSense library
)

target_link_libraries(pointcloud_filter_publisher 
  ${catkin_LIBRARIES}
  ${PCL_LIBRARIES}
  ${realsense2_LIBRARY}  # Link the RealSense library
)

install(TARGETS pointcloud_filter_node pointcloud_filter_publisher
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)