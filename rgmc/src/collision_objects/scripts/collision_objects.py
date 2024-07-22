#!/usr/bin/env python3

import rospy
import sys
from moveit_commander import RobotCommander, PlanningSceneInterface
from geometry_msgs.msg import PoseStamped
from gazebo_msgs.srv import SpawnModel, DeleteModel
from tf.transformations import quaternion_from_euler
import rospkg
import math as mt

def add_floor(planning_scene_interface):
    floor_pose = PoseStamped()
    floor_pose.header.frame_id = "base_link"
    floor_pose.pose.position.x = 0.0
    floor_pose.pose.position.y = 0.0
    floor_pose.pose.position.z = -0.01
    floor_pose.pose.orientation.w = 0.0
    planning_scene_interface.add_cylinder("floor", floor_pose, height=0.01, radius=0.1 + mt.sqrt(mt.pow(0.5, 2) + mt.pow(0.5, 2)))
    spawn_gazebo_model("floor", "pose_estimation", "floor.urdf", floor_pose)

def add_cylinder(planning_scene_interface):
    cylinder_pose = PoseStamped()
    cylinder_pose.header.frame_id = "base_link"
    cylinder_pose.pose.position.x = 0.5
    cylinder_pose.pose.position.y = 0.5
    cylinder_pose.pose.position.z = 0.15
    cylinder_pose.pose.orientation.w = 0.0
    planning_scene_interface.add_cylinder("cylinder", cylinder_pose, height=0.3, radius=0.1)
    spawn_gazebo_model("cylinder", "pose_estimation", "cylinder.urdf", cylinder_pose)

def add_box(planning_scene_interface):
    box_pose = PoseStamped()
    box_pose.header.frame_id = "base_link"
    box_pose.pose.position.x = -0.2
    box_pose.pose.position.y = -0.3
    box_pose.pose.position.z = 0.1
    box_pose.pose.orientation.w = 0.0
    planning_scene_interface.add_box("box", box_pose, size=(0.2, 0.2, 0.2))
    spawn_gazebo_model("box", "pose_estimation", "box.urdf", box_pose)

def spawn_gazebo_model(model_name, package_name, model_file, pose):
    rospack = rospkg.RosPack()
    model_path = rospack.get_path(package_name) + "/urdf/shapes/" + model_file

    with open(model_path, 'r') as model_file:
        model_xml = model_file.read()

    # Create a spawn model service proxy
    rospy.wait_for_service('/gazebo/spawn_urdf_model')
    try:
        spawn_model = rospy.ServiceProxy('/gazebo/spawn_urdf_model', SpawnModel)
        spawn_model(model_name, model_xml, "", pose.pose, "world")
    except rospy.ServiceException as e:
        rospy.logerr("Spawn URDF service call failed: {0}".format(e))

def main():
    rospy.init_node('add_objects', anonymous=True)

    planning_scene_interface = PlanningSceneInterface()
    robot = RobotCommander()

    rospy.sleep(2)

    add_floor(planning_scene_interface)
    add_cylinder(planning_scene_interface)
    add_box(planning_scene_interface)

    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
