import sys
sys.path.extend(['../', '../../'])
from ndx_manipulation import NDX_C
import time
import os
import sys
sys.path.append("../../src")
if os.name == 'nt':
    import msvcrt
    def getch():
        return msvcrt.getch().decode()
else:
    import sys, tty, termios
    fd = sys.stdin.fileno()
    old_settings = termios.tcgetattr(fd)
    def getch():
        try:
            tty.setraw(sys.stdin.fileno())
            ch = sys.stdin.read(1)
        finally:
            termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
        return ch

h = NDX_C.NDX_C('/dev/ttyUSB0', default_velocity=70)
#h.shutdown()
h.calibrate(min_pos_currents=30, max_pos_currents=50, recalibrate=False)


h.thumb_opposition(1, update_thumb_flex=True, blocking=True)
#h.grasp(g='power', max_current=100)
#h.open()
time.sleep(2)

action = 1

while action != '0':
	try:
		
		print("Press 0 to quit!")
		print("Press 1 - Pinch")
		print("Press 2 - Tripod")
		print("Press 3 - Power")
		print("Press 4 - Open")
		action = getch()
		if action == '1':
			h.grasp('pinch', blocking=False, max_current=40)

		if action == '2':
			h.grasp('tripod', blocking=False, max_current=40)

		if action == '3':
			h.grasp('power', blocking=False, max_current=40)

		if action == '4':
			h.open(blocking=True)

			#time.sleep(5)

			#h.open(blocking=True)
		'''
		time.sleep(2)
		h.grasp('tripod', blocking=False, max_current=50)
		time.sleep(7)
		h.open(blocking=True)
		
		time.sleep(8)
		h.grasp('tripod', blocking=False, max_current=50)
		time.sleep(5)
		h.open(blocking=True)
		time.sleep(4)
		'''

	except KeyboardInterrupt:
		break

time.sleep(2)

h.shutdown()



