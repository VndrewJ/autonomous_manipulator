import dynamixel_sdk as dx
import Dynamixel
import Hand
import time


class Moley_XM430(Hand.Hand):

    def __init__(self, port, thumb_id=1, index_id=2, middle_id=3, ring_pinky_id=4,
                 operating_mode=5, default_velocity=10, default_grasp_current=120):
        """
        Initialises the Moley Hand class, equipped with XM430 motors.
        Args:
            port(str): Port of motor controller.
            thumb_id(int): ID of motor for thumb flexion.
            index_id(int): ID of motor for index finger flexion.
            middle_id(int): ID of motor for middle finger flexion.
            ring_pinky_id(int): ID of motor for ring and pinky finger flexion.
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

        # Define a port handler
        port_handler = dx.PortHandler(port)

        # Define motors
        baud_rate = 3000000
        self.thumb = Dynamixel.XM430_W350(motor_id=thumb_id, port_handler=port_handler, baud_rate=baud_rate)
        self.index = Dynamixel.XM430_W350(motor_id=index_id, port_handler=port_handler, baud_rate=baud_rate)
        self.middle = Dynamixel.XM430_W350(motor_id=middle_id, port_handler=port_handler, baud_rate=baud_rate)
        self.ring_pinky = Dynamixel.XM430_W350(motor_id=ring_pinky_id, port_handler=port_handler, baud_rate=baud_rate)

        # Construct motor list
        motor_list = [self.thumb, self.index, self.middle, self.ring_pinky]

        # Call to parent constructor
        super(Moley_XM430, self).__init__(motor_list)

        # Open port
        self.open_port()

        # Set motor directions to be normal
        self.thumb.set_direction(normal=True)
        self.index.set_direction(normal=False)
        self.middle.set_direction(normal=True)
        self.ring_pinky.set_direction(normal=False)

        # Set operating mode, profile velocity
        self.set_operating_mode(operating_mode)
        self.set_profile_velocity(default_velocity)

        # Set I part in the PID to get high torques close to goal positions
        self.thumb.set_position_I_gain(100)
        self.index.set_position_I_gain(100)
        self.middle.set_position_I_gain(100)
        self.ring_pinky.set_position_I_gain(100)

        # Set default grasp current
        for motor in self.motors:
            motor.set_goal_current(self.default_grasp_current)

        # Enable torque
        self.torque_enable()

    def calibrate(self, cal_file_path='Moley_XM430_cal.csv', min_pos_currents=30, max_pos_currents=120,
                  threshold=5, recalibrate=False):
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
        # Calibrate the hand
        self._calibrate(cal_file_path=cal_file_path,
                        min_pos_currents=min_pos_currents,
                        max_pos_currents=max_pos_currents,
                        threshold=threshold,
                        recalibrate=recalibrate)

        self.set_profile_velocity(self.default_velocity)
        self.torque_enable()

        # Set default grasp current
        for motor in self.motors:
            motor.set_goal_current(self.default_grasp_current)

    def grasp(self, grasp_type, max_current=None, blocking=False):
        """
        Closes grippers until a resistance is encountered.
        Args:
            grasp_type: Type of grasp to execute. Options are: 'pinch', 'tripod' or 'power'
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
            self.thumb.set_goal_current(max_current)
            self.index.set_goal_current(max_current)
            self.middle.set_goal_current(max_current)
            self.ring_pinky.set_goal_current(max_current)
        else:
            max_current = self.default_grasp_current

        # Set goal positions
        if grasp_type == 'pinch':
            self.thumb.set_goal_position(self.thumb.max_pos)
            self.index.set_goal_position(self.index.max_pos)
        elif grasp_type == 'tripod':
            self.thumb.set_goal_position(self.thumb.max_pos)
            self.index.set_goal_position(self.index.max_pos)
            self.middle.set_goal_position(self.middle.max_pos)
        elif grasp_type == 'power':
            self.thumb.set_goal_position(self.thumb.max_pos)
            self.index.set_goal_position(self.index.max_pos)
            self.middle.set_goal_position(self.middle.max_pos)
            self.ring_pinky.set_goal_position(self.ring_pinky.max_pos)
        else:
            raise ValueError("Invalid input.")

        # Block until current limit if specified
        if blocking:
            pos = [self.thumb.get_position(), self.index.get_position(),
                   self.middle.get_position(), self.ring_pinky.get_position()]
            cur = [abs(self.thumb.get_current()), abs(self.index.get_current()),
                   abs(self.middle.get_current()), abs(self.ring_pinky.get_current())]
            while cur[0] < max_current and cur[1] < max_current and cur[2] < max_current and cur[3] < max_current:
                print("Pos: {}, abs. current: {}".format(pos, cur))
                pos = [self.thumb.get_position(), self.index.get_position(),
                       self.middle.get_position(), self.ring_pinky.get_position()]
                cur = [abs(self.thumb.get_current()), abs(self.index.get_current()),
                       abs(self.middle.get_current()), abs(self.ring_pinky.get_current())]
                time.sleep(0.02)

            # Set goal positions as they are
            self.thumb.set_goal_position(pos[0])
            self.index.set_goal_position(pos[1])
            self.middle.set_goal_position(pos[2])
            self.ring_pinky.set_goal_position(pos[3])

    def open(self, blocking=False, position_threshold=25):
        """
        Opens hand by setting all motors to their minimum values.
        Args:
            blocking(bool): If True, the function loops until target position is achieved.
            position_threshold(float): Motor position threshold.
        """
        if blocking:
            self.move_to_goal_position([self.thumb.min_pos, self.index.min_pos,
                                        self.middle.min_pos, self.ring_pinky.min_pos],
                                       tolerance=position_threshold)
        else:
            self.set_goal_position([self.thumb.min_pos, self.index.min_pos,
                                    self.middle.min_pos, self.ring_pinky.min_pos])

    def close(self, blocking=False, position_threshold=25):
        """
        Opens hand by setting all motors to their minimum values.
        Args:
            blocking(bool): If True, the function loops until target position is achieved.
            position_threshold(float): Motor position threshold.
        """
        if blocking:
            self.move_to_goal_position([self.thumb.max_pos, self.index.max_pos,
                                        self.middle.max_pos, self.ring_pinky.max_pos],
                                       tolerance=position_threshold)
        else:
            self.set_goal_position([self.thumb.max_pos, self.index.max_pos,
                                    self.middle.max_pos, self.ring_pinky.max_pos])

    def set_close_fraction(self, fraction, speed=15):
        """
        Moves fingers to fraction*(closed - open) position.
        Args:
            fraction: How much the fingers should close (scale from 0 to 100).
            speed(int): Finger speed.
        """
        # Clamp input value
        print(fraction)
        fraction = min(100.0, max(fraction, 0.0))/100
        print(fraction)

        # Set motor values
        self.set_goal_position([int(self.thumb.min_pos + fraction*self._d_max_min_lst[0]),
                                int(self.index.min_pos + fraction*self._d_max_min_lst[1]),
                                int(self.middle.min_pos + fraction*self._d_max_min_lst[2]),
                                int(self.ring_pinky.min_pos + fraction*self._d_max_min_lst[3])],
                               [speed, speed, speed, speed])
