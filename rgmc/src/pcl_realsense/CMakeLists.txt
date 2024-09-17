cmake_minimum_required(VERSION 3.0.2)
project(pcl_realsense)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  sensor_msgs
  pcl_ros
  pcl_conversions
)
find_package(PCL REQUIRED)
find_package(realsense2 REQUIRED)

catkin_package()

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${realsense2_INCLUDE_DIR}
  ${PCL_INCLUDE_DIRS}
)

link_directories(${PCL_LIBRARY_DIRS})

add_definitions(${PCL_DEFINITIONS})

add_executable(pcl_publisher src/pcl_publisher.cpp)
target_link_libraries(pcl_publisher
  ${catkin_LIBRARIES}
  ${realsense2_LIBRARY}
  ${PCL_LIBRARIES}
)

add_executable(pcl_subscriber src/pcl_subscriber.cpp)
target_link_libraries(pcl_subscriber
  ${catkin_LIBRARIES}
  ${PCL_LIBRARIES}
)
