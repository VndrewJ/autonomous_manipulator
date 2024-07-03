import dynamixel_sdk as dx
import Dynamixel
import Hand
import time


class T42_XM430(Hand.Hand):

    def __init__(self, port, left_id=1, right_id=2, operating_mode=5, default_velocity=10):
        """
        Initialises the T42 Hand class, equipped with XM430 motors.
        Args:
            port(str): Port of motor controller.
            left_id(int): ID of left motor.
            right_id(int): ID of right motor.
            operating_mode(int): 0 - Current control mode.
                                 1 - Velocity control mode
                                 3 - Position control mode
                                 4 - Extended position control mode
                                 5 - Current-based position control mode
                                 16 - PWM control mode
            default_velocity(int): Default motor velocity.
        """
        # Parameters
        self.default_velocity = default_velocity

        # Define a port handler
        port_handler = dx.PortHandler(port)

        # Define motors
        self.left = Dynamixel.XM430_W350(motor_id=left_id, port_handler=port_handler)
        self.right = Dynamixel.XM430_W350(motor_id=right_id, port_handler=port_handler)

        # Construct motor list
        motor_list = [self.left, self.right]

        # Call to parent constructor
        super(T42_XM430, self).__init__(motor_list)

        # Open port
        self.open_port()

        # Set motor directions to be normal
        self.left.set_direction(normal=True)
        self.right.set_direction(normal=True)

        # Set operating mode, profile velocity
        self.set_operating_mode(operating_mode)
        self.set_profile_velocity(default_velocity)

        # Set I part in the PID to get high torques close to goal positions
        self.left.set_position_I_gain(100)
        self.right.set_position_I_gain(100)

        # Enable torque
        self.torque_enable()

    def calibrate(self, cal_file_path='T42_XM430_cal.csv', max_current=180, recalibrate=False):
        """
        Calibrates the motor max and min positions.
        Args:
            cal_file_path(str): Path to the calibration file.
            max_current(int): Maximum current. When exceeded, maximum position is saved.
            recalibrate(bool): If True, the hand is recalibrated even if a calibration file exists.
        """
        # Define d_max_min and increment list
        d_max_min_lst = [1650, 1650]
        increments = [100, 100]

        # Calibrate the gripper
        self._calibrate_legacy(cal_file_path=cal_file_path,
                               max_current=max_current,
                               increments=increments,
                               d_max_min_lst=d_max_min_lst,
                               recalibrate=recalibrate)

        self.set_profile_velocity(self.default_velocity)

    def grasp(self, max_current):
        """
        Closes grippers until a resistance is encountered.
        Args:
            max_current: Movement stops at maximum current.
        """
        # Set appropriate operating mode
        self.set_operating_mode(5)

        # Set closed gripper goals and currents
        self.left.set_goal_position(self.left.max_pos + 300)
        self.right.set_goal_position(self.right.max_pos + 300)
        self.left.set_goal_current(max_current+5)
        self.right.set_goal_current(max_current+5)

        # Loop and wait for current limit
        pos = [self.left.get_position(), self.right.get_position()]
        cur = [abs(self.left.get_current()), abs(self.right.get_current())]
        while cur[0] < max_current or cur[1] < max_current:
            print("Pos: {}, abs. current: {}".format(pos, cur))
            pos = [self.left.get_position(), self.right.get_position()]
            cur = [abs(self.left.get_current()), abs(self.right.get_current())]
            time.sleep(0.02)

        # Set goal positions as they are
        self.left.set_goal_position(pos[0])
        self.right.set_goal_position(pos[1])
