import time
from ndx_manipulation import dynamixel_sdk as dx
from ndx_manipulation import Dynamixel
from ndx_manipulation import Hand


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


class RotaryGripper(Hand.Hand):

    def __init__(self, port, clutch_port, rotor_id=2, clutch_id=1, operating_mode=0, clutch_torque=200):
        """
        Initialises the RotaryGripper class..
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
        # Parameters
        self.clutch_torque = clutch_torque

        # Port handlers
        rotor_port_handler = get_port_handler(port)
        clutch_port_handler = get_port_handler(clutch_port)

        # Define motors
        baud_rate = 57600
        self.rotor = Dynamixel.XM430_W350(motor_id=rotor_id, port_handler=rotor_port_handler, baud_rate=baud_rate)
        self.clutch = Dynamixel.XL320(motor_id=clutch_id, port_handler=clutch_port_handler, baud_rate=baud_rate)

        # Construct motor list
        motor_list = [self.rotor, self.clutch]

        # Call to parent constructor
        super(RotaryGripper, self).__init__(motor_list)

        # Open port
        self.open_port()
        time.sleep(0.2)

        # Set motor directions
        self.rotor.set_direction(normal=True)

        # Setup rotor
        self.rotor.set_operating_mode(operating_mode)

        # Setup clutch
        self.clutch.set_operating_mode(2)
        self.clutch.set_torque_limit(clutch_torque)

        # Enable torque
        self.torque_enable()

    def engage_clutch(self):
        """
        Engages clutch of the drill mechanism.
        """
        self.clutch.set_goal_position(350, safe=False)

    def disengage_clutch(self):
        """
        Disengages clutch of the drill mechanism.
        """
        self.clutch.set_goal_position(530, safe=False)

    def close(self, current=200):
        """
        Closes rotary gripper with specified current.
        Args:
            current(int): Closing current.
        """
        # Make input positive
        current = abs(current)

        # Engage clutch
        self.engage_clutch()
        time.sleep(1.5)

        # Start closing with desired current
        self.rotor.set_goal_current(-current)
        time.sleep(0.5)

        # Rotate until velocity drops
        while abs(self.rotor.get_velocitv()) > 20:
            time.sleep(0.2)
        self.rotor.set_goal_current(0)
        time.sleep(1)

        # Spike current to get tighter grip
        self.rotor.set_goal_current(-400)
        time.sleep(0.5)
        self.rotor.set_goal_current(0)

        # Disengage clutch
        self.disengage_clutch()
        time.sleep(1.5)

    def open(self, offset, current=200):
        """
        Open rotary gripper for a specified position offset
        Args:
            offset(int): Opening offset.
            current(int): Maximum current.
        """
        # Make input positive
        current = abs(current)
        offset = abs(offset)

        # Engage clutch
        self.engage_clutch()
        time.sleep(1.5)

        # Spike current to loosen grip
        pos_init = self.rotor.get_position()
        self.rotor.set_goal_current(900)
        time.sleep(0.75)
        self.rotor.set_goal_current(0)

        # Start opening with desired current
        self.rotor.set_goal_current(current)

        # Open to desired offset
        pos = self.rotor.get_position()
        while abs(pos - pos_init) < offset:
            pos = self.rotor.get_position()
            time.sleep(0.2)
        self.rotor.set_goal_current(0)
        time.sleep(0.5)

        # Disengage clutch
        self.disengage_clutch()
        time.sleep(1)

    def rotate(self, offset, current=200):
        """
        Rotates gripper head for a specified position offset.
        Args:
            offset(int): Rotation offset. If positive, rotation is clockwise.
            current(int): Maximum current.
        """
        # Handle input
        current = abs(current)
        if offset < 0:
            current = -current
            offset = abs(offset)

        # Start rotating with desired current
        self.rotor.set_goal_current(current)

        # Rotate until desired offset
        pos_init = self.rotor.get_position()
        pos = pos_init
        while abs(pos - pos_init) < offset:
            pos = self.rotor.get_position()
            time.sleep(0.2)
        self.rotor.set_goal_current(0)
        time.sleep(0.5)

    def rotate_clockwise(self, offset, current=200):
        """
        Rotates gripper head for a specified position offset in a clockwise direction.
        Args:
            offset(int): Rotation offset.
            current(int): Maximum current.
        """
        self.rotate(abs(offset), current)

    def rotate_counterclockwise(self, offset, current=200):
        """
        Rotates gripper head for a specified position offset in a counterclockwise direction.
        Args:
            offset(int): Rotation offset.
            current(int): Maximum current.
        """
        self.rotate(-abs(offset), current)
