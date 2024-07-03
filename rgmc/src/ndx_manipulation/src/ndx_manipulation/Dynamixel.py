# Author: Gal Gorjup, adapted from Geng Gao

import ctypes
import os
import dynamixel_sdk as dx
import time


def clear():
    # for windows
    if os.name == "nt":
        _ = os.system("cls")
    else:
        _ = os.system("clear")


class Dynamixel(object):
    # Common parameters
    COMM_SUCCESS = 0
    COMM_TX_FAIL = -1001
    MOVING_THRESHOLD = 10
    PROTOCOL = 2

    # Model specific parameters
    ADDR_OPERATING_MODE = None
    ADDR_VELOCITY_LIMIT = None
    ADDR_PROFILE_VELOCITY = None
    ADDR_PROFILE_ACCELERATION = None
    ADDR_TORQUE_ENABLE = None
    ADDR_GOAL_POSITION = None
    ADDR_GOAL_VELOCITY = None
    DATASIZE_GOAL_VELOCITY = None
    ADDR_GOAL_CURRENT = None
    ADDR_PRESENT_POSITION = None
    ADDR_PRESENT_TEMP = None
    ADDR_PRESENT_CURRENT = None
    ADDR_PRESENT_VELOCITY = None
    ADDR_PRESENT_ERROR = None
    ADDR_POSITION_I_GAIN = None
    ADDR_POSITION_P_GAIN = None
    ADDR_POSITION_D_GAIN = None
    ADDR_VELOCITY_P_GAIN = None
    ADDR_VELOCITY_I_GAIN = None

    # Class definition
    def __init__(
        self, motor_id, port_handler, baud_rate, max_pos=None, min_pos=None
    ):
        """
        Initialises the Dynamixel class.
        Args:
            motor_id(int): ID of the Dynamixel.
            port_handler(dx.PortHandler): Port handler instance.
            max_pos(int): Maximum motor position.
            min_pos(int): Minimum motor position.
            baud_rate(int): Serial communication baud rate.
        """
        # Parameters
        self.id = motor_id
        self.baud_rate = baud_rate
        self.max_pos = max_pos
        self.min_pos = min_pos

        # Private variables
        self._operating_mode = None

        # Set port
        self.port = port_handler

        # Initialise PacketHandler Structs
        self.packetHandle = dx.PacketHandler(self.PROTOCOL)

    @property
    def operating_mode(self):
        if self._operating_mode is None:
            self._operating_mode = self.read(1, self.ADDR_OPERATING_MODE)
        return self._operating_mode

    def open_port(self):
        """
        Opens port and sets baud rate.
        """
        # Open port
        if self.port.openPort():
            print("Succeeded to open the port!")
        else:
            print("Failed to open the port!")
            quit()

        # Set port baud rate
        if self.port.setBaudRate(self.baud_rate):
            print("Succeeded to change the baudrate!")
        else:
            print("Failed to change the baudrate!")
            quit()

    def close_port(self):
        """
        Closes port being used by the motors.
        """
        self.port.closePort()

    def torque_enable(self):
        """
        Enables motor torque for rotation.
        """
        self.write(1, self.ADDR_TORQUE_ENABLE, 1)
        print("Dynamixel #{} torque enabled.".format(self.id))

    def torque_disable(self):
        """
        Disables motor torque for rotation.
        """
        self.write(1, self.ADDR_TORQUE_ENABLE, 0)
        print("Dynamixel #{} torque disabled.".format(self.id))

    def set_operating_mode(self, mode=3):
        """
        Disables torque and sets operating mode of Dynamixel.
        Args:
            mode(int):  Dynamixel operating mode:
                            0 - Current Control Mode
                            1 - Velocity Control Mode
                            3 - Position Control Mode
                            4 - Extended Position Control Mode
                            5 - Current-based Position Control Mode
                            16 - PWM Control Mode
        """
        # Check input
        if mode not in [0, 1, 3, 4, 5, 16]:
            raise ValueError("Invalid operating mode.")

        # Disable torque
        self.torque_disable()

        # Change operating mode
        self.write(1, self.ADDR_OPERATING_MODE, mode)
        self._operating_mode = mode

    def get_position(self):
        """
        Reads current motor position value.

        Returns:
            int: present motor position
        """
        return ctypes.c_int32(
            self.read(n_bytes=4, address=self.ADDR_PRESENT_POSITION)
        ).value

    def get_velocitv(self):
        """
        Reads current motor velocity value.

        Returns:
            int: present motor velocity
        """
        return ctypes.c_int32(
            self.read(n_bytes=4, address=self.ADDR_PRESENT_VELOCITY)
        ).value

    def get_temperature(self):
        """
        Reads current temperature value.

        Returns:
            int: present temperature
        """
        return self.read(n_bytes=1, address=self.ADDR_PRESENT_TEMP)

    def get_current(self):
        """
        Reads present current value.

        Returns:
            int: present current
        """
        current = self.read(n_bytes=2, address=self.ADDR_PRESENT_CURRENT)
        return ctypes.c_int16(current).value

    def get_error(self):
        """
        Reads current error.

        Returns:
            int: current error code
        """
        return self.read(n_bytes=1, address=self.ADDR_PRESENT_ERROR)

    def set_goal_position(self, goal_position, safe=True):
        """
        Sets goal position if in position compatible control mode.
        Args:
            goal_position(int): Position to move to.
            safe(bool): If True, goal position will not be set if it is outside the position limits
                        (self.min_pos and self.max_pos)
        """
        if self.operating_mode not in [3, 4, 5]:
            raise Warning("Dynamixel not in position control mode.")

        if safe:
            if self.min_pos is not None and self.max_pos is not None:
                if goal_position + 5 < min(
                    self.max_pos, self.min_pos
                ) or goal_position - 5 > max(self.max_pos, self.min_pos):
                    print(
                        "Desired position {} exceeds limits max {}, min {} for"
                        " motor {}. Motion not executed.".format(
                            goal_position, self.max_pos, self.min_pos, self.id
                        )
                    )
                    return
            else:
                print("Position limits undefined. Motion not executed.")
                return

        self.write(4, self.ADDR_GOAL_POSITION, goal_position)

    def set_goal_velocity(self, goal_velocity):
        """
        Sets goal velocity if in velocity control mode.
        """
        if self.operating_mode != 1:
            raise Warning("Dynamixel not in velocity control mode.")

        self.write(
            self.DATASIZE_GOAL_VELOCITY, self.ADDR_GOAL_VELOCITY, goal_velocity
        )

    def set_goal_current(self, goal_current):
        """
        Sets goal current if in curernt compatible control mode.
        """
        if self.operating_mode not in [0, 5]:
            print("Dynamixel not in current control mode.")
            # raise Warning("Dynamixel not in current control mode.")

        self.write(2, self.ADDR_GOAL_CURRENT, goal_current)

    def set_profile_velocity(self, value):
        """
        Sets velocity to be used in most of the operating modes.
        """
        self.write(4, self.ADDR_PROFILE_VELOCITY, value)

    def set_profile_acceleration(self, value):
        """
        Sets acceleration to be used in most of the operating modes.
        """
        self.write(4, self.ADDR_PROFILE_ACCELERATION, value)

    def set_position_I_gain(self, value):
        """
        Sets I gain to the position PID controller.
        """
        self.write(2, self.ADDR_POSITION_I_GAIN, value)

    def set_position_P_gain(self, value):
        """
        Sets P gain to the position PID controller.
        """
        self.write(2, self.ADDR_POSITION_P_GAIN, value)

    def set_position_D_gain(self, value):
        """
        Sets D gain to the position PID controller.
        """
        self.write(2, self.ADDR_POSITION_D_GAIN, value)

    def set_velocity_I_gain(self, value):
        """
        Sets I gain to the velocity PI controller.
        """
        self.write(2, self.ADDR_VELOCITY_I_GAIN, value)

    def set_velocity_P_gain(self, value):
        """
        Sets P gain to the velocity PI controller.
        """
        self.write(2, self.ADDR_VELOCITY_P_GAIN, value)

    def _calibrate_endpoint_pos(self, current=100, threshold=10):
        """
        Applies specified 'current' value to motor in current control,
        waits for the motor to stop moving and returns its position value.
        Args:
            current: Current to be applied to the motor.
            threshold: Maximum difference between two subsequent positions to trigger an exit.

        Returns:
            int: endpoint position
        """
        # Save old operating mode
        opmode = self.operating_mode

        # Set current control mode and enable torque
        self.set_operating_mode(0)
        self.torque_enable()

        # Set goal current
        self.set_goal_current(current)

        # Loop until the motor stops moving
        prev_pos = self.get_position()
        while True:
            time.sleep(0.2)
            pos = self.get_position()
            if abs(pos - prev_pos) < threshold:
                break
            prev_pos = pos
            print(
                "Endpoint cal. - Motor ID: {}, Position: {}".format(
                    self.id, pos
                )
            )

        # Reset the previous operating mode
        self.set_operating_mode(opmode)

        return pos

    def calibrate_min_pos(self, current=100, threshold=10):
        """
        Calibrates minimum endpoint position of the motor.
        Applies specified 'current' value to motor in current control,
        waits for the motor to stop moving and stores its position as the min value.
        Args:
            current: Current to be applied to the motor.
            threshold: Maximum difference between two subsequent positions to trigger an exit.

        Returns:
            int: min_pos
        """
        self.min_pos = self._calibrate_endpoint_pos(
            current=current, threshold=threshold
        )
        print(
            "Motor ID: {}, Calibrated minimum position: {}".format(
                self.id, self.min_pos
            )
        )
        return self.min_pos

    def calibrate_max_pos(self, current=100, threshold=10):
        """
        Calibrates maximum endpoint position of the motor.
        Applies specified 'current' value to motor in current control,
        waits for the motor to stop moving and stores its position as the max value.
        Args:
            current: Current to be applied to the motor.
            threshold: Maximum difference between two subsequent positions to trigger an exit.

        Returns:
            int: min_pos
        """
        self.max_pos = self._calibrate_endpoint_pos(
            current=current, threshold=threshold
        )
        print(
            "Motor ID: {}, Calibrated maximum position: {}".format(
                self.id, self.max_pos
            )
        )
        return self.max_pos

    def calibrate_pos_legacy(
        self, d_max_min=100, max_current=130, increment=-20
    ):
        """
        Finds maximum motor position based on current limits.
        Find minimum position based on the difference between min and max.
        Args:
            d_max_min: Difference between the minimum and maximum motor position. d_min_max=max-min
            max_current: Maximum current. When exceeded, maximum position is saved.
            increment: Increment in motor position during calibration.

        Returns:
            max_pos, min_pos
        """
        # Set calibration velocity
        self.set_profile_velocity(10)

        # Close motor and save max pos
        cur = self.get_current()
        while abs(cur) < max_current:
            pos = self.get_position()
            cur = self.get_current()
            self.set_goal_position(pos + increment, safe=False)
            print(
                "Motor ID: {}, Current: {}, Position: {}".format(
                    self.id, cur, pos
                )
            )
        self.max_pos = self.get_position()

        # Get min position
        self.min_pos = self.max_pos - d_max_min

        # Print out obtained values
        print("Max pos: {}, Min pos: {}".format(self.max_pos, self.min_pos))

        # Remove profile velocity
        self.set_profile_velocity(0)

        return self.max_pos, self.min_pos

    def is_at_goal_position(
        self, goal_position, current_position=None, tolerance=20
    ):
        """
        Checks whether motor is at goal position within the tolerance specified.
        Args:
            goal_position(int): Desired position.
            current_position(int or None): Current position. If None, current position will be read from the motor.
            tolerance: Acceptable offset from the goal position.

        Returns:
            bool: True if at goal
        """
        # Get position
        if current_position is None:
            current_position = self.get_position()

        # Check if at goal
        if abs(current_position - goal_position) < tolerance:
            return True
        return False

    def move_to_goal_position(
        self, goal_position, tolerance=10, safe=True, verbose=False
    ):
        """
        Sets goal position and loops until the motor is within tolerance of the goal.
        Args:
            goal_position(int): Goal position.
            tolerance: Acceptable offset from the goal position.
            safe(bool): If True, goal position will not be set if it is outside the position limits
                        (self.min_pos and self.max_pos)
            verbose: If True, prints out current state.
        """
        # Set goal position
        self.set_goal_position(goal_position, safe)

        # Loop until at goal
        current_pos = self.get_position()
        while not self.is_at_goal_position(
            goal_position, current_pos, tolerance=tolerance
        ):
            time.sleep(0.1)
            current_pos = self.get_position()
            if verbose:
                current = self.get_current()
                print(
                    "Cur pos: {}, Goal pos: {}, Currents: {}".format(
                        current_pos, goal_position, current
                    )
                )

    def read(self, n_bytes, address):
        """
        Reads requested number of bytes from specified address.
        Args:
            n_bytes: Number of bytes to read. Can be 1, 2 or 4.
            address: Address to read from.

        Returns:
            read value
        """
        # Read from address
        if n_bytes == 1:
            (
                value,
                dxl_comm_result,
                dxl_error,
            ) = self.packetHandle.read1ByteTxRx(self.port, self.id, address)
        elif n_bytes == 2:
            (
                value,
                dxl_comm_result,
                dxl_error,
            ) = self.packetHandle.read2ByteTxRx(self.port, self.id, address)
        elif n_bytes == 4:
            (
                value,
                dxl_comm_result,
                dxl_error,
            ) = self.packetHandle.read4ByteTxRx(self.port, self.id, address)
        else:
            raise ValueError("Invalid number of bytes to read.")

        # Validate communication result
        if dxl_comm_result != self.COMM_SUCCESS:
            print(
                "Motor {} read error: {}".format(
                    self.id, self.packetHandle.getTxRxResult(self.port)
                )
            )
        elif dxl_error != 0:
            print(
                "Motor {} read error: {}".format(
                    self.id, self.packetHandle.getRxPacketError(dxl_error)
                )
            )

        return value

    def write(self, n_bytes, address, value):
        """
        Writes requested number of bytes to specified address.
        Args:
            n_bytes: Number of bytes to write. Can be 1, 2 or 4.
            address: Address to write to.
            value: Value to write.
        """
        # Write to address
        if n_bytes == 1:
            dxl_comm_result, dxl_error = self.packetHandle.write1ByteTxRx(
                self.port, self.id, address, value
            )
        elif n_bytes == 2:
            dxl_comm_result, dxl_error = self.packetHandle.write2ByteTxRx(
                self.port, self.id, address, value
            )
        elif n_bytes == 4:
            dxl_comm_result, dxl_error = self.packetHandle.write4ByteTxRx(
                self.port, self.id, address, value
            )
        else:
            raise ValueError("Invalid number of bytes to write.")

        # Validate communication result
        if dxl_comm_result != self.COMM_SUCCESS:
            print(
                "Motor {} write error: {}".format(
                    self.id, self.packetHandle.getTxRxResult(self.port)
                )
            )
        elif dxl_error != 0:
            print(
                "Motor {} write error: {}".format(
                    self.id, self.packetHandle.getRxPacketError(dxl_error)
                )
            )

        return value


class XM430_W350(Dynamixel):
    """
    Powered at 12V, ~0.7A per motor.
    http://support.robotis.com/en/product/actuator/dynamixel_x/xm_series/xm430-w350.htm
    """

    ADDR_OPERATING_MODE = 11
    ADDR_VELOCITY_LIMIT = 44
    ADDR_PROFILE_VELOCITY = 112
    ADDR_PROFILE_ACCELERATION = 108
    ADDR_TORQUE_ENABLE = 64
    ADDR_GOAL_POSITION = 116
    ADDR_GOAL_VELOCITY = 104
    DATASIZE_GOAL_VELOCITY = 4
    ADDR_GOAL_CURRENT = 102
    ADDR_PRESENT_POSITION = 132
    ADDR_PRESENT_TEMP = 146
    ADDR_PRESENT_CURRENT = 126
    ADDR_PRESENT_VELOCITY = 128
    ADDR_PRESENT_ERROR = 70
    ADDR_DRIVE_MODE = 10
    ADDR_POSITION_I_GAIN = 82
    ADDR_POSITION_P_GAIN = 84
    ADDR_POSITION_D_GAIN = 80
    ADDR_VELOCITY_P_GAIN = 78
    ADDR_VELOCITY_I_GAIN = 76

    def __init__(
        self,
        motor_id,
        port_handler,
        baud_rate=57600,
        max_pos=None,
        min_pos=None,
    ):
        """
        Initialises the XM430_W350 class.
        Args:
            motor_id(int): ID of the Dynamixel.
            port(str): Port where controller is connected.
            max_pos(int): Maximum motor position.
            min_pos(int): Minimum motor position.
            baud_rate(int): Serial communication baud rate.
        """
        super(XM430_W350, self).__init__(
            motor_id, port_handler, baud_rate, max_pos, min_pos
        )

    def set_direction(self, normal=True):
        """
        Sets rotation direction of the XM430.
        Args:
            normal: If True, the rotation direction is set to normal.
                    If False it is set to reverse.
        """
        if normal:
            self.write(1, self.ADDR_DRIVE_MODE, 0)
        else:
            self.write(1, self.ADDR_DRIVE_MODE, 1)


class XL320(Dynamixel):
    """
    Powered at 12V, ~0.7A per motor.
    http://support.robotis.com/en/product/actuator/dynamixel_x/xm_series/xm430-w350.htm
    """

    ADDR_TORQUE_ENABLE = 24
    ADDR_PRESENT_POSITION = 37
    ADDR_GOAL_POSITION = 30
    ADDR_GOAL_VELOCITY = 32
    DATASIZE_GOAL_VELOCITY = 2
    ADDR_PRESENT_TEMP = 46
    ADDR_PRESENT_CURRENT = 41
    ADDR_PRESENT_ERROR = 50
    ADDR_POSITION_I_GAIN = 28
    ADDR_OPERATING_MODE = 11
    ADDR_TORQUE_LIMIT = 35

    def __init__(
        self,
        motor_id,
        port_handler,
        baud_rate=57600,
        max_pos=None,
        min_pos=None,
    ):
        """
        Initialises the XM430_W350 class.
        Args:
            motor_id(int): ID of the Dynamixel.
            port(str): Port where controller is connected.
            max_pos(int): Maximum motor position.
            min_pos(int): Minimum motor position.
            baud_rate(int): Serial communication baud rate.
        """
        super(XL320, self).__init__(
            motor_id, port_handler, baud_rate, max_pos, min_pos
        )

    def set_torque_limit(self, limit):
        """
        Sets torque limit for the motor as the proportion of max torque.
        Args:
            limit(int): Limit value in range from 0 to 1023.
                        Torque limit = max_torque * limit/1023
        """
        self.write(2, self.ADDR_TORQUE_LIMIT, limit)

    def set_operating_mode(self, mode=2):
        """
        Disables torque and sets operating mode of Dynamixel.
        Args:
            mode(int):  Dynamixel operating mode:
                            1 - Wheel Mode
                            2 - Joint Mode
        """
        # Check input
        if mode not in [1, 2]:
            raise ValueError("Invalid operating mode.")

        # Disable torque
        self.torque_disable()

        # Change operating mode
        self.write(1, self.ADDR_OPERATING_MODE, mode)
        self._operating_mode = mode

    def set_goal_position(self, goal_position, safe=True):
        """
        Sets goal position if in position compatible control mode.
        Args:
            goal_position(int): Position to move to.
            safe(bool): If True, goal position will not be set if it is outside the position limits
                        (self.min_pos and self.max_pos)
        """
        if self.operating_mode not in [2]:
            raise Warning("Dynamixel not in position control mode.")

        if safe:
            if self.min_pos is not None and self.max_pos is not None:
                if goal_position + 5 < min(
                    self.max_pos, self.min_pos
                ) or goal_position - 5 > max(self.max_pos, self.min_pos):
                    print(
                        "Desired position {} exceeds limits max {}, min {} for"
                        " motor {}. Motion not executed.".format(
                            goal_position, self.max_pos, self.min_pos, self.id
                        )
                    )
                    return
            else:
                print("Position limits undefined. Motion not executed.")
                return

        self.write(4, self.ADDR_GOAL_POSITION, goal_position)

    def get_position(self):
        pos = -1
        while not (0 <= pos <= 1023):
            pos = super(XL320, self).get_position()
        return pos


class XC330_T288(Dynamixel):
    """
    Powered at 12V, ~0.7A per motor.
    http://support.robotis.com/en/product/actuator/dynamixel_x/xm_series/xm430-w350.htm
    """

    ADDR_OPERATING_MODE = 11
    ADDR_VELOCITY_LIMIT = 44
    ADDR_PROFILE_VELOCITY = 112
    ADDR_PROFILE_ACCELERATION = 108
    ADDR_TORQUE_ENABLE = 64
    ADDR_GOAL_POSITION = 116
    ADDR_GOAL_VELOCITY = 104
    DATASIZE_GOAL_VELOCITY = 4
    ADDR_GOAL_CURRENT = 102
    ADDR_PRESENT_POSITION = 132
    ADDR_PRESENT_TEMP = 146
    ADDR_PRESENT_CURRENT = 126
    ADDR_PRESENT_VELOCITY = 128
    ADDR_PRESENT_ERROR = 70
    ADDR_DRIVE_MODE = 10
    ADDR_VELOCITY_I_GAIN = 76
    ADDR_VELOCITY_P_GAIN = 78
    ADDR_POSITION_D_GAIN = 80
    ADDR_POSITION_I_GAIN = 82
    ADDR_POSITION_P_GAIN = 84

    def __init__(
        self,
        motor_id,
        port_handler,
        baud_rate=57600,
        max_pos=None,
        min_pos=None,
    ):
        """
        Initialises the XM430_W350 class.
        Args:
            motor_id(int): ID of the Dynamixel.
            port(str): Port where controller is connected.
            max_pos(int): Maximum motor position.
            min_pos(int): Minimum motor position.
            baud_rate(int): Serial communication baud rate.
        """
        super(XC330_T288, self).__init__(
            motor_id, port_handler, baud_rate, max_pos, min_pos
        )

    def set_direction(self, normal=True):
        """
        Sets rotation direction of the XM430.
        Args:
            normal: If True, the rotation direction is set to normal.
                    If False it is set to reverse.
        """
        if normal:
            self.write(1, self.ADDR_DRIVE_MODE, 0)
        else:
            self.write(1, self.ADDR_DRIVE_MODE, 1)
