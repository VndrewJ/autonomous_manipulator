import sys
sys.path.extend(['../', '../../'])
from ndx_manipulation import NDX_C
import time

h = NDX_C.NDX_C('/dev/ttyUSB0', default_velocity=10)
h.shutdown()