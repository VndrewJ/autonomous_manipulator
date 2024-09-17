cmake_minimum_required(VERSION 3.0.2)

# we need FindFLANN.cmake 
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR})

project(pcl_object_recognition)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  pcl_ros
  pcl_conversions
  std_msgs
)

find_package(PCL 1.8 REQUIRED)
find_package(HDF5 REQUIRED COMPONENTS C HL)
find_package(FLANN REQUIRED)

# Find RealSense2 package
find_package(realsense2 REQUIRED)

find_package(Boost REQUIRED COMPONENTS filesystem)

catkin_package(
  CATKIN_DEPENDS roscpp pcl_ros pcl_conversions std_msgs
)

include_directories(
  ${catkin_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
  ${HDF5_INCLUDE_DIR}
  ${realsense2_INCLUDE_DIRS}
  /usr/include  # Manually add LZ4 include path
  include  # Add the include directory for your headers
)

link_directories(${PCL_LIBRARY_DIRS} /usr/lib/x86_64-linux-gnu)  # Manually add LZ4 lib directory
add_definitions(${PCL_DEFINITIONS})

add_executable(recognize_object_node src/recognize_object.cpp)

# Link necessary libraries (roscpp, rosconsole, etc.)
target_link_libraries(recognize_object_node 
  ${PCL_LIBRARIES} 
  ${Boost_LIBRARIES} 
  ${FLANN_LIBRARIES} 
  ${HDF5_C_LIBRARIES} 
  ${HDF5_HL_LIBRARIES} 
  ${catkin_LIBRARIES}  # This includes roscpp, rosconsole, etc.
  lz4  # Manually link LZ4
)

# Install targets
install(TARGETS recognize_object_node
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
