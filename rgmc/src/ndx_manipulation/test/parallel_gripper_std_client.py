#! /usr/bin/env python

import time
import rospy
import actionlib
from control_msgs.msg import GripperCommandAction, GripperCommandGoal, GripperCommand


def gripper_client():
    # Create the SimpleActionClient
    client = actionlib.SimpleActionClient('parallel_gripper', GripperCommandAction)

    # Wait until the action server has started up and started listening for goals
    client.wait_for_server()

    # Create a goal to send to the action server.
    command = GripperCommand(position=0.01, max_effort=50)
    goal = GripperCommandGoal(command=command)

    # Send the goal to the action server
    client.send_goal(goal)

    # Wait for a short period of time
    time.sleep(2)
    rospy.loginfo("Result: {}".format(client.get_result()))

    # Create a new goal and send it to the action server.
    command = GripperCommand(position=0.14, max_effort=50)
    goal = GripperCommandGoal(command=command)
    client.send_goal(goal)

    # Wait for the server to finish performing the action
    client.wait_for_result()

    # Prints out the result of executing the action
    return client.get_result()


if __name__ == '__main__':
    try:
        # Initializes a rospy node so that the SimpleActionClient can publish and subscribe over ROS.
        rospy.init_node('gripper_client')
        result = gripper_client()
        rospy.loginfo("Result: {}".format(result))
    except rospy.ROSInterruptException:
        rospy.logerr("Program interrupted before completion")
