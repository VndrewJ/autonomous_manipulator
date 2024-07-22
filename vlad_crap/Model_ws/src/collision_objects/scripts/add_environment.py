#!/usr/bin/env python3

import rospy
import sys
from moveit_commander import RobotCommander, PlanningSceneInterface
from geometry_msgs.msg import PoseStamped
from visualization_msgs.msg import Marker
import math as mt

def add_floor(planning_scene_interface):
    floor_pose = PoseStamped()
    floor_pose.header.frame_id = "base_link"
    floor_pose.pose.position.x = 0.0
    floor_pose.pose.position.y = 0.0
    floor_pose.pose.position.z = -0.11
    floor_pose.pose.orientation.w = 0.0
    planning_scene_interface.add_cylinder("floor", floor_pose, height = 0.01, radius = 0.1 + mt.sqrt(mt.pow(0.5,2) + mt.pow(0.5,2)))

def main():
    rospy.init_node('add_cylinder', anonymous=True)

    planning_scene_interface = PlanningSceneInterface()
    robot = RobotCommander()

    rospy.sleep(2)

    add_floor(planning_scene_interface)
    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
