#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import JointState
import numpy as np
import math as mt

def joint_states_callback(data):
    # Callback function to print joint states

    pos = data.position

    OT0 = [[mt.cos(pos[2]), 0, mt.sin(pos[2]), 0],
           [mt.sin(pos[2]), 0, -mt.cos(pos[2]), 0],
           [0, 1, 0, 0.1625],
           [0, 0, 0, 1]]
    
    OT1 = [[mt.cos(pos[1]), -mt.sin(pos[1]), 0, -0.425*mt.cos(pos[1])],
           [mt.sin(pos[1]), mt.cos(pos[1]), 0, -0.425*mt.sin(pos[1])],
           [0, 0, 1, 0],
           [0, 0, 0, 1]]
    
    OT2 = [[mt.cos(pos[0]), -mt.sin(pos[0]), 0, -0.3922 * mt.cos(pos[0])],
           [mt.sin(pos[0]), mt.cos(pos[0]), 0, -0.3922 * mt.sin(pos[0])],
           [0, 0, 1, 0],
           [0, 0, 0, 1]]
    
    OT3 = [[mt.cos(pos[3]), 0, mt.sin(pos[3]), 0],
           [mt.sin(pos[3]), 0, -mt.cos(pos[3]), 0],
           [0, 1, 0, 0.1333],
           [0, 0, 0, 1]]
    
    OT4 = [[mt.cos(pos[4]), 0, -mt.sin(pos[4]), 0],
           [mt.sin(pos[4]), 0, mt.cos(pos[4]), 0],
           [0, -1, 0, 0.0997],
           [0, 0, 0, 1]]
    
    OT5 = [[mt.cos(pos[5]), -mt.sin(pos[5]), 0, 0],
           [mt.sin(pos[5]), mt.cos(pos[5]), 0, 0],
           [0, 0, 1, 0.0996],
           [0, 0, 0, 1]]
    
    DP1 = np.dot(OT0, OT1)
    DP2 = np.dot(DP1, OT2)
    DP3 = np.dot(DP2, OT3)
    DP4 = np.dot(DP3, OT4)
    DP5 = np.dot(DP4, OT5)

    beta = mt.atan2(-DP5[2][0],mt.sqrt(mt.pow(DP5[1][0],2) + mt.pow(DP5[0][0],2)))
    alpha = mt.atan2(DP5[1][0]/mt.cos(beta),DP5[0][0]/mt.cos(beta))
    gamma = mt.atan2(DP5[2][1]/mt.cos(beta), DP5[2][2]/mt.cos(beta))

    rospy.loginfo("\nX:      %s, \nY:      %s, \nZ:      %s, \nAlpha:  %s, \nBeta:   %s, \nGamma:  %s", DP5[0][3], DP5[1][3], DP5[2][3]+0.1, mt.degrees(alpha), mt.degrees(beta), mt.degrees(gamma))
#     rospy.loginfo("\n%s\n%s\n%s\n%s\n%s\n%s", mt.degrees(pos[0]), mt.degrees(pos[1]), mt.degrees(pos[2]), mt.degrees(pos[3]), mt.degrees(pos[4]), mt.degrees(pos[5]))
    

def joint_state_subscriber():
    rospy.init_node('joint_state_subscriber', anonymous=True)
    rospy.Subscriber("/ur5e/joint_states", JointState, joint_states_callback)
    rospy.spin()

if __name__ == '__main__':
    try:
        joint_state_subscriber()
    except rospy.ROSInterruptException:
        pass

    