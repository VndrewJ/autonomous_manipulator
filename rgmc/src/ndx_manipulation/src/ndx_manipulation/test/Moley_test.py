import sys
sys.path.extend(['../', '../../'])
from ndx_manipulation import Moley_XM430
import time

h = Moley_XM430.Moley_XM430('/dev/ttyUSB0')
h.calibrate(min_pos_currents=20, max_pos_currents=120, recalibrate=False)
#h.shutdown()

h.open()
time.sleep(3)
#ip = input("Enter Input")
h.grasp('power', max_current=140)
#print 'here'
#time.sleep(10)
#h.open()
time.sleep(7)
h.shutdown()


