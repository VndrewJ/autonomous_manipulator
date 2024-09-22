import dynamixel_sdk as dx
from ndx_manipulation import Dynamixel
from ndx_manipulation import Hand
import time
import pandas as pd


class NDX_C(Hand.Hand):

    def __init__(self, port, thumb_opp_id=2, thumb_id=1, index_id=3, middle_id=4, ring_id=5, pinky_id=6,
                 operating_mode=5, default_velocity=30, default_grasp_current=90):
        """
        Initialises the NDX_C Hand class, equipped with XM430 motors.
        Args:
            port(str): Port of motor controller.
            thumb_opp_id(int): ID of motor for thumb opposition.
            thumb_id(int): ID of motor for thumb flexion.
            index_id(int): ID of motor for index finger flexion.
            middle_id(int): ID of motor for middle finger flexion.
            ring_id(int): ID of motor for ring finger flexion.
            pinky_id(int): ID of motor for pinky finger flexion.
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
        self._opposition_offset = None
        self._thumb_min_abduction = None
        self._thumb_max_abduction = None

        # Define a port handler
        port_handler = dx.PortHandler(port)

        # Define motors
        baud_rate = 57600
        self.thumb_opp = Dynamixel.XM430_W350(motor_id=thumb_opp_id, port_handler=port_handler, baud_rate=baud_rate)
        self.thumb = Dynamixel.XM430_W350(motor_id=thumb_id, port_handler=port_handler, baud_rate=baud_rate)
        self.index = Dynamixel.XM430_W350(motor_id=index_id, port_handler=port_handler, baud_rate=baud_rate)
        self.middle = Dynamixel.XM430_W350(motor_id=middle_id, port_handler=port_handler, baud_rate=baud_rate)
        self.ring = Dynamixel.XM430_W350(motor_id=ring_id, port_handler=port_handler, baud_rate=baud_rate)
        self.pinky = Dynamixel.XM430_W350(motor_id=pinky_id, port_handler=port_handler, baud_rate=baud_rate)

        # Construct motor list
        motor_list = [self.thumb_opp, self.thumb, self.index, self.middle, self.ring, self.pinky]

        # Call to parent constructor
        super(NDX_C, self).__init__(motor_list)

        # Open port
        self.open_port()
        time.sleep(0.2)

        # Set motor directions
        self.thumb_opp.set_direction(normal=False)
        self.thumb.set_direction(normal=False)
        self.index.set_direction(normal=True)
        self.middle.set_direction(normal=True)
        self.ring.set_direction(normal=True)
        self.pinky.set_direction(normal=True)

        # Set operating mode, profile velocity
        self.set_operating_mode(operating_mode)
        self.set_profile_velocity(default_velocity)

        # Set I part in the PID to get high torques close to goal positions
        self.thumb_opp.set_position_I_gain(100)
        self.thumb.set_position_I_gain(100)
        self.index.set_position_I_gain(100)
        self.middle.set_position_I_gain(100)
        self.ring.set_position_I_gain(100)
        self.pinky.set_position_I_gain(100)

        # Enable torque
        self.torque_enable()

    def calibrate(self, cal_file_path='NDX_C_cal.csv', min_pos_currents=30, max_pos_currents=110,
                  threshold=5, recalibrate=False):
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
                # Handle thumb
                self._opposition_offset = df.iloc[-1, 0]
                self._thumb_min_abduction = self.thumb.min_pos
                self._thumb_max_abduction = self.thumb.max_pos
                return
            except IOError:
                print("Calibration file not found")

        # Position containers
        max_pos_lst = []
        min_pos_lst = []

        # Process current args for min and max
        min_pos_currents = self._process_int_array(min_pos_currents, len(self.motors))
        max_pos_currents = self._process_int_array(max_pos_currents, len(self.motors))
        max_pos_currents[0] = min_pos_currents[0]

        # Calibrate thumb abduction
        print("Calibrating thumb abduction.")
        time.sleep(2)
        self.thumb_opp.calibrate_min_pos(current=-min_pos_currents[0], threshold=threshold)
        self.thumb_opp.min_pos = self.thumb_opp.min_pos + 180
        min_pos_lst.append(self.thumb_opp.min_pos)
        self.thumb_opp.torque_enable()
        self.thumb_opp.move_to_goal_position(self.thumb_opp.min_pos, tolerance=5, safe=False)
        print("Calibrating thumb in abduction. Please hold thumb in open position.")
        time.sleep(5)
        thumb_min_abduction = self.thumb.calibrate_min_pos(current=min_pos_currents[1], threshold=threshold)

        # Calibrate thumb opposition
        print("Calibrating thumb opposition.")
        time.sleep(4)
        self.thumb_opp.calibrate_max_pos(current=max_pos_currents[0], threshold=threshold)
        self.thumb_opp.max_pos = self.thumb_opp.max_pos - 80
        max_pos_lst.append(self.thumb_opp.max_pos)
        self.thumb_opp.torque_enable()
        self.thumb_opp.move_to_goal_position(self.thumb_opp.max_pos, tolerance=5, safe=False)
        print("Calibrating thumb in opposition. Please hold thumb in open position.")
        time.sleep(5)
        thumb_min_opposition = self.thumb.calibrate_min_pos(current=min_pos_currents[1], threshold=threshold)

        # Put thumb into abduction
        print("Abducting thumb.")
        time.sleep(4)
        self.thumb.torque_enable()
        self.thumb.move_to_goal_position(thumb_min_abduction, safe=False)
        self.thumb_opp.torque_enable()
        self.thumb_opp.move_to_goal_position(self.thumb_opp.min_pos, tolerance=5)

        # Calibrate the rest of the fingers
        print("Calibrating min positions. Please ensure fingers stay in open position.")
        time.sleep(4)
        for current, motor in zip(min_pos_currents[1:], self.motors[1:]):
            # Set current and wait for steady state
            motor.calibrate_min_pos(current=current, threshold=threshold)

            # Set open position
            motor.torque_enable()
            motor.set_goal_position(motor.min_pos, safe=False)
            min_pos_lst.append(motor.min_pos)
            time.sleep(2)

        print("Calibrating max positions.")
        time.sleep(4)
        for current, motor in zip(max_pos_currents[1:], self.motors[1:]):
            # Set current and wait for steady state
            motor.calibrate_max_pos(current=current, threshold=threshold)

            # Set open position
            motor.torque_enable()
            motor.set_goal_position(motor.min_pos)
            max_pos_lst.append(motor.max_pos)
            time.sleep(2)

        # Get and save opposition offset parameter
        self._opposition_offset = thumb_min_opposition - thumb_min_abduction
        self._thumb_min_abduction = self.thumb.min_pos
        self._thumb_max_abduction = self.thumb.max_pos
        min_pos_lst.append(self._opposition_offset)
        max_pos_lst.append(self._opposition_offset)

        # Save calibration
        d = {'MAX_POS': max_pos_lst,
             'MIN_POS': min_pos_lst}
        df = pd.DataFrame(data=d)
        df.to_csv(cal_file_path, encoding='utf-8', index=False)

        # Set default grasp current, but not for opposition
        for motor in self.motors[1:]:
            motor.set_goal_current(self.default_grasp_current)

        # Set velocity and enable torque
        self.set_profile_velocity(self.default_velocity)
        self.torque_enable()

    def thumb_opposition(self, opposition_fraction, update_thumb_flex=True, blocking=False):
        """
        Sets thumb position as a fraction between abduction and opposition.
        The thumb flexion motor min and max values are updated.
        Args:
            opposition_fraction(float):
                Desired thumb position as a fraction between abduction and opposition.
                If 0, thumb gets set to abduction.
                If 1, thumb gets set to opposition.
                Anything in between corresponds to a position between the two.
            update_thumb_flex(bool): If True, the thumb flexion is updated with respect to the target position.
            blocking(bool): If True, the function loops until target position is achieved.
        """
        # Update thumb min and max positions
        self.thumb.min_pos = int(self._thumb_min_abduction + opposition_fraction*self._opposition_offset)
        self.thumb.max_pos = int(self._thumb_max_abduction + opposition_fraction * self._opposition_offset)

        # Compute target thumb opposition
        target_opp_pose = int(self.thumb_opp.min_pos + opposition_fraction*(self.thumb_opp.max_pos - self.thumb_opp.min_pos))

        # Get target thumb position if necessary
        thumb_goal = None
        if update_thumb_flex:
            thumb_goal = int(self._thumb_min_abduction + opposition_fraction * self._opposition_offset)

        # Execute motion
        if blocking:
            self.move_to_goal_position([target_opp_pose, thumb_goal, None, None, None, None],
                                       speed_lst=[self.default_velocity,
                                                  int(self.default_velocity/2),
                                                  None, None, None, None],
                                       tolerance=10)
        else:
            self.set_goal_position([target_opp_pose, thumb_goal, None, None, None, None],
                                   speed_lst=[self.default_velocity,
                                              int(self.default_velocity/2),
                                              None, None, None, None],)

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
            self.ring.set_goal_current(max_current)
            self.pinky.set_goal_current(max_current)
        else:
            max_current = self.default_grasp_current

        # Set goal positions
        if grasp_type == 3:
            self.thumb.set_goal_position(self.thumb.max_pos)
            self.index.set_goal_position(self.index.max_pos)
        elif grasp_type == 4:
            self.thumb.set_goal_position(self.thumb.max_pos)
            self.index.set_goal_position(self.index.max_pos)
            self.middle.set_goal_position(self.middle.max_pos)
        elif grasp_type == 6:
            self.thumb.set_goal_position(self.thumb.max_pos)
            self.index.set_goal_position(self.index.max_pos)
            self.middle.set_goal_position(self.middle.max_pos)
            self.ring.set_goal_position(self.ring.max_pos)
            self.pinky.set_goal_position(self.pinky.max_pos)
        elif grasp_type == 1:
            self.thumb.set_goal_position(self.thumb.max_pos)
        elif grasp_type == 2:
            self.thumb.set_goal_position(self.thumb.max_pos)                            
            self.middle.set_goal_position(self.middle.max_pos)
            self.ring.set_goal_position(self.ring.max_pos)
            self.pinky.set_goal_position(self.pinky.max_pos)
        elif grasp_type == 8:
            self.middle.set_goal_position(self.middle.max_pos)
            self.ring.set_goal_position(self.ring.max_pos)
            self.pinky.set_goal_position(self.pinky.max_pos)
        elif grasp_type == 9:
            self.index.set_goal_position(self.index.max_pos)                            
            self.middle.set_goal_position(self.middle.max_pos)
            self.ring.set_goal_position(self.ring.max_pos)
            self.pinky.set_goal_position(self.pinky.max_pos)
        elif grasp_type == 7:
            self.ring.set_goal_position(self.ring.max_pos)
            self.pinky.set_goal_position(self.pinky.max_pos)
        elif grasp_type == 5:
            self.thumb.set_goal_position(self.thumb.max_pos)                            
            self.middle.set_goal_position(self.middle.max_pos)
            self.ring.set_goal_position(self.ring.max_pos)
            self.index.set_goal_position(self.index.max_pos)
        else:
            raise ValueError("Invalid input.")



        # Block until current limit if specified
        if blocking:
            pos = [self.thumb.get_position(), self.index.get_position(),
                   self.middle.get_position(), self.ring.get_position(), self.pinky.get_position()]
            cur = [abs(self.thumb.get_current()), abs(self.index.get_current()),
                   abs(self.middle.get_current()), abs(self.ring.get_current()), abs(self.pinky.get_current())]
            print("Pos: {}, abs. current: {}".format(pos, cur))
            while cur[0] < max_current and cur[1] < max_current and cur[2] < max_current and cur[3] < max_current and cur[4] < max_current:
                print("Pos: {}, abs. current: {}".format(pos, cur))
                pos = [self.thumb.get_position(), self.index.get_position(),
                       self.middle.get_position(), self.ring.get_position(), self.pinky.get_position()]
                cur = [abs(self.thumb.get_current()), abs(self.index.get_current()),
                       abs(self.middle.get_current()), abs(self.ring.get_current()), abs(self.pinky.get_current())]
                time.sleep(0.02)

            # Set goal positions as they are
            self.thumb.set_goal_position(pos[0])
            self.index.set_goal_position(pos[1])
            self.middle.set_goal_position(pos[2])
            self.ring.set_goal_position(pos[3])
            self.pinky.set_goal_position(pos[4])

    def open(self, blocking=False, position_threshold=25):
        """
        Opens hand by setting all motors to their minimum values.
        Args:
            blocking(bool): If True, the function loops until target position is achieved.
            position_threshold(float): Motor position threshold.
        """
        if blocking:
            self.move_to_goal_position([None, self.thumb.min_pos, self.index.min_pos,
                                        self.middle.min_pos, self.ring.min_pos, self.pinky.min_pos],
                                       tolerance=position_threshold)
        else:
            self.set_goal_position([None, self.thumb.min_pos, self.index.min_pos,
                                    self.middle.min_pos, self.ring.min_pos, self.pinky.min_pos])

    def close(self, blocking=False, position_threshold=25):
        """
        Opens hand by setting all motors to their minimum values.
        Args:
            blocking(bool): If True, the function loops until target position is achieved.
            position_threshold(float): Motor position threshold.
        """
        if blocking:
            self.move_to_goal_position([None, self.thumb.max_pos, self.index.max_pos,
                                        self.middle.max_pos, self.ring.max_pos, self.pinky.max_pos],
                                       tolerance=position_threshold)
        else:
            self.set_goal_position([None, self.thumb.max_pos, self.index.max_pos,
                                    self.middle.max_pos, self.ring.max_pos, self.pinky.max_pos])

