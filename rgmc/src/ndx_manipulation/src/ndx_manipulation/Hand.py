from ndx_manipulation.Dynamixel import Dynamixel
import pandas as pd
import time


class Hand(object):
    def __init__(self, motor_list):
        """
        Initialises the Hand class.
        Args:
            motor_list(list[Dynamixel.Dynamixel]): List of Dynamixel motor objects.
        """
        # Parameters
        self.torque_enabled = False

        # Save the motors locally
        self.motors = motor_list

    def shutdown(self):
        """
        Disables torque and closes ports to all motors in hand.
        """
        self.torque_disable()
        time.sleep(0.5)
        self.close_port()

    def open_port(self):
        for motor in self.motors:
            motor.open_port()

    def close_port(self):
        for motor in self.motors:
            motor.close_port()

    def torque_enable(self):
        if not self.torque_enabled:
            for motor in self.motors:
                motor.torque_enable()
            self.torque_enabled = True

    def torque_disable(self):
        for motor in self.motors:
            motor.torque_disable()
        self.torque_enabled = False

    def get_positions(self):
        pos = []
        for motor in self.motors:
            pos.append(motor.get_position())
        return pos

    def get_currents(self):
        cur = []
        for motor in self.motors:
            cur.append(motor.get_current())
        return cur

    def set_operating_mode(self, mode):
        for motor in self.motors:
            if motor.operating_mode != mode:
                motor.set_operating_mode(mode)

    def set_profile_velocity(self, value):
        for motor in self.motors:
            motor.set_profile_velocity(value)

    def set_goal_position(
        self, pos_lst, speed_lst=None, curr_lst=None, safe=True
    ):
        """
        Sets goal position for all motors in the hand.
        Args:
            pos_lst(list[int]): List of goal motor positions.
                                If a position in pos_lst is None, the motor is skipped.
            speed_lst: List of motor profile velocities.
            curr_lst: List of desired motor currents (if in current control mode).
        """
        # Check provided list lengths
        if len(pos_lst) != len(self.motors):
            raise ValueError("Position and motor count mismatch")
        if speed_lst is not None and len(speed_lst) != len(self.motors):
            raise ValueError("Speed and motor count mismatch")
        if curr_lst is not None and len(curr_lst) != len(self.motors):
            raise ValueError("Current and motor count mismatch")

        # Set the values
        for i, motor in enumerate(self.motors):
            if pos_lst[i] is not None:
                if curr_lst is not None:
                    motor.set_goal_current(curr_lst[i])
                if speed_lst is not None:
                    motor.set_profile_velocity(speed_lst[i])
                motor.set_goal_position(pos_lst[i], safe=safe)

    def move_to_goal_position(
        self,
        pos_lst,
        speed_lst=None,
        curr_lst=None,
        tolerance=20,
        verbose=True,
    ):
        """
        Sets goal positions and loops until all motors are within tolerance of the goal.
        Args:
            pos_lst(list[int]): List of goal positions.
                                If a position in pos_lst is None, the motor is skipped.
            speed_lst: List of motor profile velocities.
            curr_lst: List of desired motor currents (if in current control mode).
            tolerance: Acceptable offset from the goal positions.
            verbose: If True, prints out current state.
        """
        # Set goal position
        self.set_goal_position(pos_lst, speed_lst, curr_lst)

        # Loop until at goal
        current_pos_lst = self.get_positions()
        while not self.is_at_goal_position(
            pos_lst, current_pos_lst, tolerance=tolerance
        ):
            current_pos_lst = self.get_positions()
            if verbose:
                currents_lst = self.get_currents()
                print(
                    "Cur pos: {}, Goal pos: {}, Currents: {}".format(
                        current_pos_lst, pos_lst, currents_lst
                    )
                )

    def is_at_goal_position(
        self, goal_position_lst, current_position_lst=None, tolerance=20
    ):
        """
        Checks whether motors in hand are at goal position within the tolerance specified.
        Args:
            goal_position_lst(list[int]): Desired position list.
                                          If a position in the list is None, the motor is skipped.
            current_position_lst(list[int] or None): Current position list. If None, current positions are read from the motor.
            tolerance: Acceptable offset from the goal positions.

        Returns:
            bool: True if all motors at goal
        """
        # If current positions not given, each motor should read them
        if current_position_lst is None:
            current_position_lst = [None] * len(goal_position_lst)

        for motor, goal_position, current_position in zip(
            self.motors, goal_position_lst, current_position_lst
        ):
            if goal_position is not None:
                if not motor.is_at_goal_position(
                    goal_position, current_position, tolerance=tolerance
                ):
                    return False
        return True

    def _calibrate_legacy(
        self,
        cal_file_path,
        max_current,
        increments,
        d_max_min_lst,
        recalibrate=False,
    ):
        """
        Calibrates the motor max and min positions.
        Args:
            cal_file_path(str): Path to the calibration file.
            max_current(int): Maximum current. When exceeded, maximum position is saved.
            increments(list[int]): List of increments in motor position during calibration.
            d_max_min_lst(list[int]): List of differences between the maximum and minimum motor position.
                                      These values are gripper specific.
                                      d_max_min[i] = max[i] - min[i]
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
                return
            except IOError:
                print("Calibration file not found")

        # Calibrate
        max_pos_lst = []
        min_pos_lst = []
        for i, motor in enumerate(self.motors):
            motor.calibrate_pos_legacy(
                d_max_min_lst[i], max_current, increments[i]
            )
            motor.set_goal_position(motor.min_pos)
            max_pos_lst.append(motor.max_pos)
            min_pos_lst.append(motor.min_pos)
            time.sleep(3)

        # Save calibration
        d = {"MAX_POS": max_pos_lst, "MIN_POS": min_pos_lst}
        df = pd.DataFrame(data=d)
        df.to_csv(cal_file_path, encoding="utf-8", index=False)

    def _process_int_array(self, array, target_length):
        """
        Validates if an input is a list or tuple of length 'target_length'.
        If input is an integer or float, converts it to a list of integers with length 'target_length'.
        Args:
            array: User input to process.
            target_length: Size of the array.

        Returns:
            list: processed_array
        """
        if isinstance(array, (list, tuple)):
            # Check if lengths match
            if len(array) != target_length:
                raise ValueError("Input array length mismatch.")
        elif isinstance(array, (int, float)):
            # If input is a single value, expand it to a list
            return [int(array)] * target_length
        else:
            raise ValueError("Invalid input.")
        return array

    def _calibrate(
        self,
        cal_file_path,
        min_pos_currents,
        max_pos_currents,
        threshold=5,
        recalibrate=False,
    ):
        """
        Calibrates the motor max and min positions.
        Min positions are calibrated first (user may hold fingers in place).
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

        # Calibrate min positions
        print(
            "Calibrating min positions in 5s. Please ensure fingers stay in"
            " open position."
        )
        time.sleep(5)
        for current, motor in zip(min_pos_currents, self.motors):
            # Set current and wait for steady state
            motor.calibrate_min_pos(current=current, threshold=threshold)

            # Set open position
            # motor.min_pos = motor.get_position() - offset
            motor.torque_enable()
            motor.set_goal_position(motor.min_pos, safe=False)
            min_pos_lst.append(motor.min_pos)
            time.sleep(2)

        # Calibrate max positions
        print("Calibrating max positions in 5s.")
        time.sleep(5)
        for current, motor in zip(max_pos_currents, self.motors):
            # Set current and wait for steady state
            motor.calibrate_max_pos(current=current, threshold=threshold)

            # Set open position
            # motor.max_pos = motor.get_position() - offset
            motor.torque_enable()
            motor.set_goal_position(motor.min_pos)
            max_pos_lst.append(motor.max_pos)
            time.sleep(2)

        # Save calibration
        d = {"MAX_POS": max_pos_lst, "MIN_POS": min_pos_lst}
        df = pd.DataFrame(data=d)
        df.to_csv(cal_file_path, encoding="utf-8", index=False)
