import sys
sys.path.extend(['../', '../../'])
from ndx_manipulation import NDX_C
import time

h = NDX_C.NDX_C('/dev/ttyUSB1', default_velocity=30)
#h.shutdown()
h.calibrate(min_pos_currents=30, max_pos_currents=50, recalibrate=False)


h.thumb_opposition(1, update_thumb_flex=True, blocking=True)
#h.grasp(g='power', max_current=100)
#h.open()
time.sleep(2)

h.grasp('power', blocking=False, max_current=50)

time.sleep(5)

h.open(blocking=True)

time.sleep(2)

h.shutdown()



