import sys
sys.path.extend(['../', '../../'])
from ndx_manipulation import Parallel_XM430
import time

h = Parallel_XM430.Parallel_XM430(port='/dev/ttyUSB0', default_velocity=30)
#h.shutdown()
h.calibrate(min_pos_currents=30, max_pos_currents=100, recalibrate=False)

#h.open(blocking=True)
h.grasp(blocking=True, max_position=4000, max_current=45)

time.sleep(5)

h.shutdown()
print("Done")


