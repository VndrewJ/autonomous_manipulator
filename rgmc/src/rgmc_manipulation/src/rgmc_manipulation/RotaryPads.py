from tabnanny import verbose
import time
import dynamixel_sdk as dx
from ndx_manipulation.Dynamixel import XC330_T288
from ndx_manipulation.Hand import Hand
import pandas as pd
import numpy as np


def get_port_handler(port):
    """
    Performs type checking for port input.
    Args:
        port(str / dx.PortHandler): Port of motor controller.

    Returns:
        dx.PortHandler: port handler
    """
    if type(port) == str:
        return dx.PortHandler(port)
    elif type(port) == dx.PortHandler:
        return port
    else:
        raise ValueError("Invalid port type")


class RotaryPads(Hand):
    def __init__(
        self,
        port,
        ids,
        operating_mode=5,
        default_velocity=250,
        default_effort=400,
        port_handler=None,
    ):
        """
        Initialises the RotaryPads class..
        Args:
            port(str / dx.PortHandler): Port of motor controller.
            clutch_port(str / dx.PortHandler): Port of clutch controller.
            rotor_id(int): ID of the main rotary component motor.
            clutch_id(int): ID of the gripper clutch.
            operating_mode(int): 0 - Current control mode.
                                 1 - Velocity control mode
                                 3 - Position control mode
                                 4 - Extended position control mode
                                 5 - Current-based position control mode
                                 16 - PWM control mode
        """

        # Port handlers
        if port_handler is None:
            self.port_handler = get_port_handler(port)
        else:
            self.port_handler = port_handler

        # Define motors
        baud_rate = 57600
        print(self.port_handler)
        motor_list = [
            XC330_T288(
                motor_id=ids[0],
                port_handler=self.port_handler,
                baud_rate=baud_rate,
            ),
            XC330_T288(
                motor_id=ids[1],
                port_handler=self.port_handler,
                baud_rate=baud_rate,
            ),
        ]

        # Call to parent constructor
        super(RotaryPads, self).__init__(motor_list)

        # Open port
        self.open_port()
        time.sleep(0.2)

        self.torque_disable()

        # Set motor directions
        self.motors[0].set_direction(normal=True)
        self.motors[1].set_direction(normal=False)

        # Set P values
        motor_list[0].set_position_P_gain(2000)
        motor_list[1].set_position_P_gain(2000)
        motor_list[0].set_position_D_gain(2000)
        motor_list[1].set_position_D_gain(2000)

        # Set operating mode, profile velocity
        self.set_operating_mode(operating_mode)
        self.default_velocity = default_velocity
        self.default_effort = default_effort

        self.motor_offset_list = [
            self.motors[0].get_position(),
            self.motors[1].get_position(),
        ]
        self.pos = self.get_positions()
        # Enable torque
        self.torque_enable()

    def rotate(self, position, velocity=None, current=300, tolerance=10):

        # Handle input
        current = abs(current)

        # Converting angles to pulses (2pi = 360 degrees = 4096 pulses)
        pulses = int((4096 / (2 * np.pi)) * position)

        # Start rotating with desired current

        self.motors[0].set_goal_current(current)
        self.motors[1].set_goal_current(current)

        if velocity is None:
            velocity = self.default_velocity

        # Rotate until desired offset
        target_pulse_position = [
            pulses + self.motor_offset_list[0],
            pulses + self.motor_offset_list[1],
        ]
        self.pos = self.get_positions()
        self.set_goal_position(
            target_pulse_position,
            speed_lst=[velocity] * len(self.motors),
            curr_lst=[current] * len(self.motors),
            safe=False,
        )

        all_reached_goal = False
        while not all_reached_goal:
            all_reached_goal = self.is_at_goal_position(
                goal_position_lst=target_pulse_position,
                current_position_lst=self.pos,
                tolerance=tolerance,
            )
            self.pos = [
                self.motors[0].get_position(),
                self.motors[1].get_position(),
            ]
            print(f"Target: {target_pulse_position}, Current: {self.pos}")
            # time.sleep(0.05)
        # Hack to get over tolerance issues
        time.sleep(0.2)
        return True

    def shutdown(self):
        for motor in self.motors:
            motor.torque_disable()

    def get_pad_positions(self):
        return [
            self.pos[0] - self.motor_offset_list[0],
            self.pos[1] - self.motor_offset_list[1],
        ]

    def get_pad_angles(self):
        pad_pos = self.get_pad_positions()
        pul2rad = (2 * np.pi) / 4096
        return [pul2rad * pad_pos[0], pul2rad * pad_pos[1]]
