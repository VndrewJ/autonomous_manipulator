import dynamixel_sdk as dx
import Dynamixel
import Hand
import time


class M2_XM430(Hand.Hand):

    def __init__(self, port, inner_id=1, outer_id=2, operating_mode=5, default_velocity=10):
        """
        Initialises the M2 Hand class, equipped with XM430 motors.
        Args:
            port(str): Port of motor controller.
            inner_id: ID of motor closing the distal joint.
            outer_id: ID of motor opening the distal joint.
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
        self.inner = Dynamixel.XM430_W350(motor_id=inner_id, port_handler=port_handler)
        self.outer = Dynamixel.XM430_W350(motor_id=outer_id, port_handler=port_handler)

        # Construct motor list
        motor_list = [self.inner, self.outer]

        # Call to parent constructor
        super(M2_XM430, self).__init__(motor_list)

        # Open port
        self.open_port()

        # Set motor directions to be normal
        self.inner.set_direction(normal=True)
        self.outer.set_direction(normal=True)

        # Set operating mode, profile velocity
        self.set_operating_mode(operating_mode)
        self.set_profile_velocity(default_velocity)

        # Set I part in the PID to get high torques close to goal positions
        self.inner.set_position_I_gain(100)
        self.outer.set_position_I_gain(100)

        # Enable torque
        self.torque_enable()

    def calibrate(self, cal_file_path='M2_XM430_cal.csv', max_current=300, recalibrate=False):
        """
        Calibrates the motor max and min positions.
        Args:
            cal_file_path(str): Path to the calibration file.
            max_current(int): Maximum current. When exceeded, maximum position is saved.
            recalibrate(bool): If True, the hand is recalibrated even if a calibration file exists.
        """
        # Define d_max_min and increment list
        d_max_min_lst = [1400, 1200]
        increments = [100, 100]

        # Calibrate the gripper
        self._calibrate_legacy(cal_file_path=cal_file_path,
                               max_current=max_current,
                               increments=increments,
                               d_max_min_lst=d_max_min_lst,
                               recalibrate=recalibrate)

        self.set_profile_velocity(self.default_velocity)

    def grasp(self, max_current, priority='inner', speed=10):
        """
        Closes finger until a resistance is encountered.
        The priority motor leads the grasp, followed by the second.
        Args:
            max_current(int): Movement stops at maximum current.
            priority(str): Which motor executes the grasp first.
                           Can be 'inner' or 'outer'
            speed(int): Motor velocity when closing gripper.
        """
        # Check priority
        if priority not in ['inner', 'outer']:
            raise ValueError("Invalid priority input")

        # Set appropriate operating mode
        self.set_operating_mode(5)

        # Grasp first with priority motor
        priority_motor_idx = 0
        second_motor_idx = 1
        if priority == 'outer':
            priority_motor_idx = 1
            second_motor_idx = 0

        # Set speeds
        self.inner.set_profile_velocity(speed)
        self.outer.set_profile_velocity(speed)

        # Close priority motor
        self.motors[priority_motor_idx].set_goal_current(max_current + 10)
        self.motors[priority_motor_idx].set_goal_position(self.motors[priority_motor_idx].max_pos)
        pos = self.motors[priority_motor_idx].get_position()
        cur = abs(self.motors[priority_motor_idx].get_current())
        while cur < max_current:
            print("Pos: {}, abs. current: {}".format(pos, cur))
            pos = self.motors[priority_motor_idx].get_position()
            cur = abs(self.motors[priority_motor_idx].get_current())
            time.sleep(0.02)
        self.motors[priority_motor_idx].set_goal_position(pos)

        # Close second motor
        self.motors[second_motor_idx].set_goal_current(int(0.5*max_current))
        self.motors[second_motor_idx].set_goal_position(self.motors[second_motor_idx].max_pos)
        pos = self.motors[second_motor_idx].get_position()
        cur = abs(self.motors[second_motor_idx].get_current())
        while cur < int(0.45*max_current):
            print("Pos: {}, abs. current: {}".format(pos, cur))
            pos = self.motors[second_motor_idx].get_position()
            cur = abs(self.motors[second_motor_idx].get_current())
            time.sleep(0.02)
        self.motors[second_motor_idx].set_goal_position(pos)

