# ROBUST 6DoF OBJECT POSITION ESTIMATION METHODS FOR MANUFACTURING (2024)
Authors: Andrew Koh, Vladislav Colpman 

Supervisor: Minas Liarokapis


This is a quick guide to the autonomous_assembly_robot repository for the above part 4 project. It covers the installation, setup and usage of the code and its various functions incuding **simulation, 6D Pose Estimation**, and **usage with the UR5e**.
This repository includes old packages from the 2020 *Robot Grasping and Manipulation Competition (RGMC)* phd project.

# Installation
Linux Ubuntu is required for this project. You'll need Ubuntu 20.04 LTS so you can install our specific ROS version. 

This repository requires Robot Operating System (ROS) to work. Specifically ROS1-Noetic version of ROS. The installation and setup for ROS1-Noetic can be shown [here](https://wiki.ros.org/noetic/Installation/Ubuntu). 

We also recommend going through the beginner tutorials to familiarise yourself with ROS.

## Setting up the ROS workspace
There are two ways to successfully install the workspace onto your pc.

### 1. Forking the repo
The easiest way is to fork the repo from the github link [here](https://github.com/VndrewJ/autonomous_manipulator). This can easily be done by going to the respository page and clicking the **fork this repository** button, then cloning as usual.

### 2. Extracting the Zip File
Extract the repository into your preferred location on your pc. Then navigate to the repository and recursively delete all '.git' files. Then create a new repository.

```bash
# this command will recurisvely delete all .git files allowing you to create a new repo from it

cd path/to/autonomous_assembly_robot/
find . -name ".git" -type d -exec rm -rf {} +
```

## Building the workspace
First you'll need to install all dependencies for all the packages we have. This can be done using the following command:

```bash
# installs all dependencies
rosdep install --from-paths src --ignore-src -r -y
```

Ensure PCL is version 1.12

To compile the code, you need to be in the root directory of the original ROS workspace. This is 'rgmc'.

```bash
# Once in the autonomous_assembly_manipulator directory
cd rgmc/

# Builds the workspace (using catkin)
catkin_make
```
Other useful cammands include
```bash
# cleans the compile
catkin_make clean

# Source the workspace (REMEMBER TO DO THIS WHEN OPENING A NEW TERMINAL WINDOW)
source devel/setup.bash
```

# Simulation
This section covers all the packages used in the simulation task for the project and how to run it.

- pose_estimation (main package, contains all the launch files)
- camera_moveit_config (contains the config to make the camera **and** ur5e work in simulation)
- camera_sim_config (contains the config to make just the camera work in simulation)
- forward_kinematics (the package for running the forward-kinematics in simulation)
- collision_objects (adds objects into simulation to test the forward kinematics)

No further setup is required.

## Running the simulation
To run the entirety of the simulation, all you need is this command.
```bash
roslaunch pose_estimation ur5e_camera_controller.launch
```

This will launch 2 instances of Rviz, one for controlling the UR5e and one for viewing the camera.
An additional instance of the Gazebo Simulator will appear showing the setup with collision and gravity.

### 1. Controlling the robot
To control the robot, simply click on the joystick controller in the RViz window and drag it to your desired position. Then clock **plan and execute** or **plan** then **execute**. This will cause the robot to start moving in both RViz and Gazebo.

### 2. Using the camera
The camera is automatically on when launching the simulation. To check how it works, go into Gazebo and spawn some objects. Place these objects in the camera's view. In RViz, you should be able to see contour lines of the objects.

### 3. Running the Forward Kinematics
To run the forward kinematics, which gets the position of the end effector, run the following command.
```bash
roslaunch collision_objects collision_objects.launch
```
This will spawn in the objects for forward kinematics testing into RViz. However,you will need to manually spawn them into Gazebo to view them there too.

### Additional Scripts
We also have a script for a simple publisher-subscriber mechanism for the Intel Realsense D435i camera. This will launch the camera to capture depth data, and send them to a subscriber node which will display on a new window on your pc.

```bash
# Launch the roscore, this is required to run ros nodes
roscore

# In a new terminal, run the publisher
rosnode pose_estimation camera_publisher.py

# In a new terminal again, run the subscriber
rosnode pose_estimation camera_subscriber.py
```
# VFH Pose Estimation
To use the VFH Pose Estimation algorithm, you'll need the Intel Realsense D435i Depth camera. Connect this to your pc. Pick a clear area with minimal clutter and an object of your choice. We recommend primitive objects. 

The following packages are used in VFH Pose Estimation:
- pcl_pose_estimation (contains all three scripts and their launch files needed for pose estimation)

## Capturing Data
The following command will launch the capture to collect point cloud data of an object of your choice. A window will pop up and you'll need to zoom out (scroll wheel) and maybe move the camera around to view what the camera sees. You should be able to see the filtered point cloud capturing just the objects in the scene (floor is gone).

```bash
roslaunch pcl_pose_estimation capture_pcd.launch
```
This will run for 5 seconds. You can adjust the time this is run in *capture_pcd.cpp*

Be sure to capture all faces around the object. We recommend using a turntable to rotate the object around when the camera is capturing it or using a tilt pan.


Other parameters that you can change include the parameters for all the filters. This is covered in the report.

## Building the model
The captured data will be stored in the *data* directory in the package. Data from 1 capture session is stored with the date and time as its name. Inside the file contains cluster directories. Each cluster *should* be a different object. Results may vary. Inside a cluster directory is the pcd data which is split into two files, the PCD file and the VFH file. 
```bash
# Example file tree
pcl_pose_estimation/
└── data/
    ├── data_date_time1/
    │   ├── cluster_0
    │   ├── cluster_1
    │   ├── cluster_2
    │   ├── cluster_3
    │   └── cluster_4
    └── data_date_time2/
        ├── cluster_0
        ├── cluster_1
        ├── cluster_2
        ├── cluster_3
        └── cluster_4
```
Get rid of all the clusters you don't want.

To build the model, all you need to run is the following
```bash
roslaunch pcl_pose_estimation build_tree.launch
```
The *kdtree.idx*, *training_data.h5*, and *training_data.list* files will appear in the data directory.

NOTE: If you are having issues rebuilding a model, delete the above 3 files and try build again.
## Testing the code
This will get the pose of the object. Right now, the code is set to only output the xyz axis with respect to the camera, however, you can modify the *nearest_neighbor.cpp* code to output the orientation too. 

To run this code, you'll need to modify the *nearest_neighbor.launch* file with the VFH file of your choice. Here is a snippet of the launch file for where you need to modify:

```xml
<node name="nearest_neighbor_node" pkg="pcl_pose_estimation" type="nearest_neighbor_node" output="screen"
      args="--k 16 --thresh 50.0 
            <!-- Modify the line below, changing what data you want to use. It must always be a vfh file. -->
            $(find pcl_pose_estimation)/data/data_2024-10-8_16-23-57/cluster_0/point_cloud_frame_8_cluster_0_vfh.pcd 
            $(find pcl_pose_estimation)/data/kdtree.idx 
            $(find pcl_pose_estimation)/data/training_data.h5 
            $(find pcl_pose_estimation)/data/training_data.list"/>
            <param name="x_ee" value="$(arg x_ee)" />
            <param name="y_ee" value="$(arg y_ee)" />
            <param name="z_ee" value="$(arg z_ee)" />
            <param name="rx" value="$(arg rx)" />
            <param name="ry" value="$(arg ry)" />
            <param name="rz" value="$(arg rz)" />
</launch>
```
Here our chosen VFH file is *point_cloud_frame_8_cluster_0_vfh.pcd* which is in *cluster_0* which is part of the data captured at *2024-10-8(date) 16-23-57(time)*

Finally, run the command
```bash
roslaunch pcl_pose_estimation nearest_neighbor.launch
```
A window should pop up showing the object's point cloud and a red sphere will appear showing the coordinates of it. In the terminal, the pose of the object within the camera's reference frame will be output.

# Robust CAD-based Pose Estimation
The following is a guide on how to use the model-based pose estimation.
The following packages are used in this:
- real_sense_alignment_pcl (is the robust alignment method to align the model to the scene)
- visualization_node_pkg (visualises the estimation)

## Creating the model
First you'll need to recreate your chosen object in CAD and export its STL file. To convert it to pcd file to create a model, do the following:
```bash
rosrun real_sense_alignment_pcl /dir/to/pcd_file.stl
```
This will generate a pcd file for your object in the root dir of the package.

## Running the pose estimation
First you'll need to modify the *real_sense_alignment.cpp* to get the correct model.
```cpp
//line 68, modify the path to the generated pcd file
    if (pcl::io::loadPCDFile<pcl::PointXYZ>("/home/mechp4p/autonomous_manipulator/rgmc/src/real_sense_alignment_pcl/data/object_converted.pcd", *object) == -1)
    {
        ROS_ERROR("Couldn't read object PCD file.");
        return;
    }

```

To run the pose estimation use the following command:
```bash
roslaunch visualization_node_pkg visualization.launch
```
This will run the filtering, alignment, and visualiser and output the pose of the object.
This may take a while.

# UR5e Integration
This section covers how to setup and run the VFH Pose Estimation with the UR5e robot.

## Setup
Screw the camera mount onto the UR5e robot. Ask Minas or the postgrad students for the mount or CAD file. Then screw the camera onto the mount.

Next attach the gripper onto the camera mount. The CAD file for it is provided [here](https://cad.onshape.com/documents/3defb3de1aee2a346f9a286d/w/b1467f092d6dfb3d0f8d6504/e/7993513a29736463e065116d?renderMode=0&uiState=670c9a5489f32d03ac2575c2)

To operate (control) the UR5e, please ask one of the postgrads to teach you.

## Running the code
This is mainly the same as running the VFH Pose Estimation as mentioned previously, however, you'll need to modify *nearest_neighbor.launch* again.

Before running *nearest_neighbor.launch* you need to change the position of where the camera captured the object from. These coordinates can be taken from the UR5e's GUI.
```xml
<launch>
<!-- Define the node -->

<arg name="x_ee" default="0.02235" />
<arg name="y_ee" default="0.43267" />
<arg name="z_ee" default="-0.11492" />
<arg name="rx" default="1.768" />
<arg name="ry" default="-3.1.679" />
<arg name="rz" default="1.918" />

```

Otherwise, run the code as usual. 

