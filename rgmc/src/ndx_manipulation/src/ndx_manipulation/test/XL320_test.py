import time
from ndx_manipulation import Dynamixel
from ndx_manipulation import dynamixel_sdk as dx

ph = dx.PortHandler('/dev/ttyUSB0')
m = Dynamixel.XL320(1, ph)

m.open_port()
m.set_operating_mode(2)

m.torque_enable()

m.set_torque_limit(400)
time.sleep(0.1)

m.set_goal_position(500, False)

for i in range(30):
    print(m.get_position())
    time.sleep(0.1)

m.torque_disable()
m.close_port()

