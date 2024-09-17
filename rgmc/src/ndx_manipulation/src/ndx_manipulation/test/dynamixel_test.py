import time
import sys
sys.path.extend(['../', '../../'])
from ndx_manipulation import Dynamixel
from ndx_manipulation import dynamixel_sdk as dx


ph = dx.PortHandler('/dev/ttyUSB0')
xm = Dynamixel.XM430_W350(1, ph)
xm.open_port()
xm.set_operating_mode(5)
xm.set_direction(normal=True)
xm.torque_enable()

xm.calibrate_pos_legacy(d_max_min=1553, max_current=120, increment=20)
time.sleep(3)

xm.set_goal_position(xm.min_pos)
time.sleep(3)
xm.set_goal_position(xm.max_pos)
time.sleep(3)


xm.torque_disable()

