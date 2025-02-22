import dynamixel_sdk as dx
from ndx_manipulation.Dynamixel import XM430_W350
from ndx_manipulation.Hand import Hand
import time
import pandas as pd
import copy
import numpy as np


class Parallel_XM430(Hand):
    def __init__(
        self,
        port,
        motor_id=1,
        operating_mode=5,
        default_velocity=50,
        default_grasp_current=90,
        port_handler=None,
        finger_max_aperture=0,
    ):
        """
        Initialises the NDX_C Hand class, equipped with XM430 motors.
        Args:
            port(str): Port of motor controller.
            motor_id(int): ID of motor.
            operating_mode(int): 0 - Current control mode.
                                 1 - Velocity control mode
                                 3 - Position control mode
                                 4 - Extended position control mode
                                 5 - Current-based position control mode
                                 16 - PWM control mode
            default_velocity(int): Default motor velocity.
            default_grasp_current(int): Default grasp current.
        """
        # Parameters
        self.default_velocity = default_velocity
        self.default_grasp_current = default_grasp_current
        self.finger_max_aperture = finger_max_aperture
        # Define a port handler
        if port_handler is None:
            self.port_handler = dx.PortHandler(port)
        else:
            self.port_handler = port_handler

        # Define motors
        baud_rate = 57600
        self.motor = XM430_W350(
            motor_id=motor_id,
            port_handler=self.port_handler,
            baud_rate=baud_rate,
        )

        # Construct motor list
        motor_list = [self.motor]

        # Call to parent constructor
        super(Parallel_XM430, self).__init__(motor_list)

        # Open port
        self.open_port()
        time.sleep(0.2)

        # Set motor directions
        self.motor.set_direction(normal=True)

        # Set operating mode, profile velocity
        self.set_operating_mode(operating_mode)
        self.set_profile_velocity(default_velocity)

        # Set I part in the PID to get high torques close to goal positions
        self.motor.set_position_I_gain(100)

        # Enable torque
        self.torque_enable()

    def calibrate(
        self,
        cal_file_path="Parallel_cal.csv",
        min_pos_currents=20,
        max_pos_currents=80,
        threshold=5,
        recalibrate=False,
    ):
        """
        Calibrates the motor max and min positions.
        Min positions are calibrated first (user may hold fingers in place).
        The thumb is calibrated twice, once for each opposition state.
        If integer currents are given, opposition is calibrated with the min_pos_currents.
        Args:
            cal_file_path(str): Path to the calibration file.
            min_pos_currents(int / list[int]): Current(s) for calibrating min endpoint position.
                                               If int, same current is used for all motors.
            max_pos_currents(int / list[int]): Current(s) for calibrating max endpoint position.
                                               If int, same current is used for all motors.
            threshold: Maximum difference between two subsequent positions to trigger calibration exit.
            recalibrate(bool): If True, the hand is recalibrated even if a calibration file exists.
        """
        # Check if calibration file exists
        if not recalibrate:
            try:
                print("Reading calibration file:")
                df = pd.read_csv(cal_file_path)
                print(df)
                for i, motor in enumerate(self.motors):
                    motor.max_pos = df.iloc[i, 0]
                    motor.min_pos = df.iloc[i, 1]
                self.motor_max_aperture = (
                    self.motor.max_pos - self.motor.min_pos
                )
                return
            except IOError:
                print("Calibration file not found")

        # Position containers
        max_pos_lst = []
        min_pos_lst = []

        # Process current args for min and max
        min_pos_currents = self._process_int_array(
            min_pos_currents, len(self.motors)
        )
        max_pos_currents = self._process_int_array(
            max_pos_currents, len(self.motors)
        )
        max_pos_currents[0] = min_pos_currents[0]

        # Calibrate the rest of the fingers
        print(
            "Calibrating min positions. Please ensure fingers stay in open"
            " position."
        )
        time.sleep(3)
        for current, motor in zip(min_pos_currents, self.motors):
            # Set current and wait for steady state
            motor.calibrate_min_pos(current=-current, threshold=threshold)

            # Set open position
            motor.torque_enable()
            motor.set_goal_position(motor.min_pos, safe=False)
            min_pos_lst.append(motor.min_pos)
            time.sleep(2)

        print("Calibrating max positions.")
        time.sleep(3)
        for current, motor in zip(max_pos_currents, self.motors):
            # Set current and wait for steady state
            motor.calibrate_max_pos(current=current, threshold=threshold)

            # Set open position
            motor.torque_enable()
            motor.set_goal_position(motor.min_pos)
            max_pos_lst.append(motor.max_pos)
            time.sleep(2)

        # Save calibration
        d = {"MAX_POS": max_pos_lst, "MIN_POS": min_pos_lst}
        df = pd.DataFrame(data=d)
        df.to_csv(cal_file_path, encoding="utf-8", index=False)

        # Set default grasp current, but not for opposition
        for motor in self.motors[1:]:
            motor.set_goal_current(self.default_grasp_current)

        # Set velocity and enable torque
        self.set_profile_velocity(self.default_velocity)
        self.torque_enable()

        self.motor_max_aperture = self.motor.max_pos - self.motor.min_pos

    def grasp(
        self,
        grasp_type="close",
        max_position=None,
        max_current=None,
        blocking=False,
    ):
        """
        Closes grippers until a resistance is encountered.
        Args:
            grasp_type: Type of grasp to execute. Options are: 'pinch', 'tripod' or 'power'
            max_position: Movement stops at maximum position.
                         If None, the limit position is used.
            max_current: Movement stops at maximum current.
                         If None, any previously set goal current is used.
            blocking: If False, the function sets maximum goal positions and exits.
                      If True, the function loops until max current is reached on any of the motors
                      and sets those positions as goal.
        """
        # Set appropriate operating mode
        for motor in self.motors:
            if motor.operating_mode != 5:
                self.set_operating_mode(5)
                self.torque_enable()

        # Set goal currents if specified
        if max_current is not None:
            self.motor.set_goal_current(max_current)
        else:
            max_current = self.default_grasp_current

        if max_position is None:
            max_position = self.motor.max_pos

        # Set goal positions
        if grasp_type == "close":
            self.motor.set_goal_position(max_position)
        else:
            raise ValueError("Invalid input.")

        # Block until current limit if specified
        if blocking:
            pos = [self.motor.get_position()]
            cur = [abs(self.motor.get_current())]
            print("Pos: {}, abs. current: {}".format(pos, cur))
            if max_current >= 0:
                while (cur[0]) < max_current and abs(
                    (max_position - np.array(pos))
                ) > 5:
                    print("Pos: {}, abs. current: {}".format(pos, cur))
                    pos = [self.motor.get_position()]
                    cur = [abs(self.motor.get_current())]
                    time.sleep(0.02)
                    # print((pos < max_position-5 or pos > max_position+5))

            if max_current < 0:
                while (cur[0]) > max_current and abs(
                    (max_position - np.array(pos))
                ) > 15:
                    print("Pos: {}, abs. current: {}".format(pos, cur))
                    pos = [self.motor.get_position()]
                    cur = [abs(self.motor.get_current())]
                    time.sleep(0.02)
                    # print((pos < max_position-5 or pos > max_position+5))

            # Set goal positions as they are
            self.motor.set_goal_position(pos[0])

    def open(self, blocking=False, position_threshold=25):
        """
        Opens hand by setting all motors to their minimum values.
        Args:
            blocking(bool): If True, the function loops until target position is achieved.
            position_threshold(float): Motor position threshold.
        """
        if blocking:
            self.move_to_goal_position(
                [self.motor.min_pos], tolerance=position_threshold
            )
        else:
            self.set_goal_position([self.motor.min_pos])

    def close(self, blocking=False, position_threshold=25):
        """
        Opens hand by setting all motors to their minimum values.
        Args:
            blocking(bool): If True, the function loops until target position is achieved.
            position_threshold(float): Motor position threshold.
        """
        if blocking:
            self.move_to_goal_position(
                [self.motor.max_pos], tolerance=position_threshold
            )
        else:
            self.set_goal_position([self.motor.max_pos])

    def get_finger_position(self, motor_pos=None):
        if motor_pos is None:
            motor_pos = self.motor.get_position()
        return (
            (float(self.motor.max_pos - motor_pos) / self.motor_max_aperture)
            * self.finger_max_aperture
            / 2
        )

    def move_finger_to_position(
        self,
        aperture,
        speed=None,
        max_curr=None,
        tolerance=20,
        verbose=True,
    ):

        goal_pos = self.motor.max_pos - int(
            self.motor_max_aperture * (aperture / self.finger_max_aperture)
        )
        return self.move_to_goal_position(
            [goal_pos], [speed], [max_curr], tolerance, verbose
        )
