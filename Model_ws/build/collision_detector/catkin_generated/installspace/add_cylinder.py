#!/usr/bin/env python3

import rospy
import sys
from moveit_commander import RobotCommander, PlanningSceneInterface
from geometry_msgs.msg import PoseStamped
from visualization_msgs.msg import Marker

def add_cylinder(planning_scene_interface):
    cylinder_pose = PoseStamped()
    cylinder_pose.header.frame_id = "base_link"
    cylinder_pose.pose.position.x = 0.0
    cylinder_pose.pose.position.y = 0.0
    cylinder_pose.pose.position.z = 1.0
    cylinder_pose.pose.orientation.w = 1.0
    planning_scene_interface.add_cylinder("cylinder", cylinder_pose, height=2.0, radius=0.5)

def main():
    rospy.init_node('add_cylinder', anonymous=True)

    planning_scene_interface = PlanningSceneInterface()
    robot = RobotCommander()

    rospy.sleep(2)

    add_cylinder(planning_scene_interface)

    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
