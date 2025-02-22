#! /usr/bin/env python

import time
import numpy as np
import rospy
import actionlib
from sensor_msgs.msg import JointState
from ndx_manipulation.msg import TFGCommandAction, TFGCommandFeedback, TFGCommandResult
from threading import Lock
from ndx_manipulation.srv import ndx_a_command, ndx_a_commandResponse
import os
from ndx_manipulation import SEPHand


class SEP(object):
    # create messages that are used to publish feedback/result
    _feedback = TFGCommandFeedback()
    _result = TFGCommandResult()

    def __init__(self, name):
        home = os.path.expanduser('~')

        # Mutex for motor IO
        self.mutex = Lock()

        # Parameters
        self.rate_hz = rospy.get_param("~publish_rate", 10)
        self.default_velocity = rospy.get_param("~default_velocity", 100)
        self.default_effort = rospy.get_param("~default_effort", 60)
        self.joint_names = rospy.get_param("~joint_names", '')
        self.port = rospy.get_param("~port", '/dev/ttyUSB1')
        opmode = rospy.get_param("~opmode", 5)
        motor_id = rospy.get_param("~motor_id", [1, 2])
        cal_file_path = rospy.get_param("~cal_file_path", os.path.join(home, 'calibration'))
        cal_file_name = rospy.get_param("~cal_file_name", os.path.join(cal_file_path, 'SEP_cal.csv'))
        recalibrate = rospy.get_param("~recalibrate", False)

        # Check if write path exist
        if not os.path.isdir(cal_file_path):
            os.makedirs(cal_file_path)

        # Start gripper
        # self.gripper = NDX_TFG(port=self.port, finger_1=motor_id[0], finger_2=motor_id[1], finger_3=motor_id[2],
        #                        finger_2_rot=motor_id[3], finger_3_rot=motor_id[4], operating_mode=opmode,
        #                        default_velocity=self.default_velocity, default_grasp_current=self.default_effort)
        self.gripper = SEPHand.SEPHand(self.port, default_velocity=self.default_velocity)

        # Calibrate gripper
        self.gripper.calibrate(cal_file_path=os.path.join(cal_file_path, cal_file_name), recalibrate=recalibrate,
                               min_pos_currents=30, max_pos_currents=50)
        # self.gripper.open(blocking=True)
        # self.gripper.torque_disable()

        # #  Update Motor Positions
        # self.gripper_pos = self.gripper.get_positions()
        # self.gripper_cur = self.gripper.get_currents()

        # Advertise Service
        rospy.Service('~sep_control', ndx_a_command, self.gesture_callback)
        rospy.Service('~sep_force_control', ndx_a_command, self.closing_callback)

        # Initialise joint state publisher
        # self._js_pub = rospy.Publisher('~joint_states', JointState, queue_size=1)

        # Gripper variables
        # self.motor_pos = self.gripper.get_positions()
        # self.motor_cur = self.gripper.get_currents()

        # # Start action server
        # self._action_name = name
        # self._as = actionlib.SimpleActionServer(self._action_name, TFGCommandAction,
        #                                         execute_cb=self.execute_callback, auto_start=False)
        # self._as.start()

    def pub_js(self):
        ############################### NOT MODIFIED FOR SEP ########################################
        # Get motor position and current
        self.mutex.acquire()
        self.gripper_pos, self.gripper_cur = self.get_positions()
        # print(self.gripper_pos)
        self.mutex.release()

        # Construct message
        msg = JointState()
        msg.header.stamp = rospy.Time.now()
        msg.name = self.joint_names
        finger_pos = self.gripper_pos

        # Make joint angles
        finger_pos[0] = (3.05 * float(self.gripper_pos[0] - self.gripper.finger_1.min_pos)) / \
                        (self.gripper.finger_1.max_pos - self.gripper.finger_1.min_pos)
        finger_pos[1] = (3.05 * float(self.gripper_pos[1] - self.gripper.finger_2.min_pos)) / \
                        (self.gripper.finger_2.max_pos - self.gripper.finger_2.min_pos)

        # print(finger_pos)
        msg.position = [finger_pos[0], finger_pos[1], finger_pos[2], finger_pos[3], finger_pos[4]]
        msg.effort = [self.gripper_cur[0], self.gripper_cur[1], self.gripper_cur[2],
                      self.gripper_cur[3], self.gripper_cur[4]]

        # Publish message
        self._js_pub.publish(msg)
        self.mutex.acquire()
        self.gripper_pos, self.gripper_cur = self.get_positions()
        # print(self.gripper_pos)
        self.mutex.release()

    def gesture_callback(self, req):

        r = ndx_a_commandResponse()

        # print(grasp_type)
        self.mutex.acquire()
        if req.name != 'open':
            self.gripper.grasp(req.name, max_current=req.effort)
        else:
            self.gripper.open()
        self.mutex.release()

        r.success = True
        return r

    def execute_callback(self, goal):
        ################################# NOT MODIFIED FOR SEP ###########################################
        # Variables
        rate = rospy.Rate(self.rate_hz)
        success = True
        reached_goal = False
        stalled = True

        # # Bound requested aperture
        # desired_aperture = goal.position
        # if desired_aperture > self.max_aperture:
        #     desired_aperture = self.max_aperture
        # if desired_aperture < 0:
        #     desired_aperture = 0

        # Extract goal
        grasp = goal.grasp
        finger_angle = goal.finger_angle
        is_deg = goal.is_deg
        max_effort = int(goal.max_effort)
        velocity = int(goal.velocity)

        # Handle Grasp type
        if grasp == 1.0:
            goal_pos = [self.gripper.finger_1.max_pos, self.gripper.finger_2.max_pos, self.gripper.finger_3.max_pos,
                        None, None]
            grasp_type = 'close'
        elif grasp == 0.0:
            goal_pos = [self.gripper.finger_1.min_pos, self.gripper.finger_2.min_pos, self.gripper.finger_3.min_pos,
                        None, None]
            grasp_type = 'open'

        # # Flip effort if opening
        # if goal_pos < self.motor_pos:
        #     max_effort = -max_effort

        # Handle missing input
        if max_effort == 0:
            max_effort = self.default_effort
        if velocity == 0:
            velocity = self.default_velocity

        effort_list = []
        vel_list = []
        for i in range(3):
            effort_list.append(max_effort)
            vel_list.append(velocity)

        for i in range(2):
            effort_list.append(None)
            vel_list.append(None)

        # Print inputs
        rospy.loginfo("{}: Executing, setting gripper to position {} with max effort {} and velocity {}"
                      .format(self._action_name, goal_pos, max_effort, velocity))

        # Set motor velocity, position and effort
        self.mutex.acquire()
        self.gripper.finger_rot_angle(angle=finger_angle, is_deg=is_deg, max_current=max_effort, blocking=False)
        self.mutex.release()
        time.sleep(0.5)
        self.mutex.acquire()
        self.gripper.set_goal_position(pos_lst=goal_pos, speed_lst=vel_list, curr_lst=effort_list)
        self.mutex.release()

        # Loop until at goal or preempted
        pos = self.gripper_pos
        cur = self.gripper_cur
        # aperture = (float(self.gripper.motor.max_pos - pos[0]) / self.motor_aperture) * self.max_aperture
        while np.sign(max_effort)*(max_effort - cur[0]) > 0 and np.sign(max_effort)*(max_effort - cur[1]) > 0 \
                and np.sign(max_effort)*(max_effort - cur[2]) > 0:
            # Get motor position and current
            pos = self.gripper_pos
            cur = self.gripper_cur
            rate.sleep()

            # If at position goal, break loop
            # print("Motor1: {}, Motor2: {}, Motor3: {}".format(abs((goal_pos[0] - pos[0])), abs((goal_pos[1] - pos[1])),
            #                                                   abs((goal_pos[2] - pos[2]))))
            # print("Motor1G: {}, Motor1P: {}, Motor2G: {}, Motor2P: {}, Motor3G: {}, Motor3P: {}".
            #       format(goal_pos[0], pos[0], goal_pos[1], pos[1], goal_pos[2], pos[2]))
            print("Motor1CurG: {}, Motor1CurP: {}, Motor2CurG: {}, Motor2CurP: {}, Motor3CurG: {}, Motor3CurP: {}".
                  format(effort_list[0], cur[0], effort_list[1], cur[1], effort_list[2], cur[2]))
            if abs((goal_pos[0] - pos[0])) < 15 and abs((goal_pos[1] - pos[1])) < 15 and abs((goal_pos[2] - pos[2])) < 15:
                stalled = False
                reached_goal = True
                break

            # Check that preempt has not been requested by the client
            if self._as.is_preempt_requested():
                rospy.loginfo("{}: Preempted".format(self._action_name))
                self._as.set_preempted()
                success = False
                break

            # Publish feedback
            self._feedback.reached_goal = reached_goal
            self._feedback.stalled = stalled
            self._as.publish_feedback(self._feedback)

        if success:
            # Set goal positions as they are
            self.mutex.acquire()
            self.gripper.set_goal_position(pos)
            self.mutex.release()

            # Return result
            self._result.reached_goal = reached_goal
            self._result.stalled = stalled
            rospy.loginfo("{}: Succeeded".format(self._action_name))
            self._as.set_succeeded(self._result)

    def get_positions(self):
        pos = []
        cur = []
        for motor in self.gripper.motors:
            pos.append(motor.get_position())
            cur.append(abs(motor.get_current()))
        # print("Pos: {}, Current: {}".format(pos, cur))
        return pos, cur

    def run(self):
        # Set rate
        rate = rospy.Rate(self.rate_hz)

        # Loop and publish gripper state
        # self.gripper.grasp(grasp_type='close', max_current=70, blocking=False)
        while not rospy.is_shutdown():
            rate.sleep()

    def run2(self):
        # Set rate
        rate = rospy.Rate(self.rate_hz)

        # Loop and publish gripper state
        while not rospy.is_shutdown():

            # Get motor position and current
            self.mutex.acquire()
            self.motor_pos = self.gripper.get_positions()
            self.motor_cur = self.gripper.get_currents()
            self.mutex.release()

            # Construct message
            msg = JointState()
            msg.header.stamp = rospy.Time.now()
            msg.name = self.joint_names
            finger_pos = (float(self.gripper.motor.max_pos - self.motor_pos[0]) / self.motor_aperture) * self.max_aperture / 2
            msg.position = [finger_pos, finger_pos]
            msg.effort = self.motor_cur

            # Publish message
            self._js_pub.publish(msg)

            rate.sleep()

        # Shut down gripper before exiting
        self.gripper.shutdown()


if __name__ == '__main__':
    # Initialise node
    rospy.init_node('gripper')

    # Start server
    c = SEP(rospy.get_name())
    c.run()
    c.gripper.shutdown()
