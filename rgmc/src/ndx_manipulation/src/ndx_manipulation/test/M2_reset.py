import sys
sys.path.extend(['../', '../../'])
from ndx_manipulation import M2_XM430


# Define hand
m2 = M2_XM430.M2_XM430('/dev/ttyUSB0', 1, 2, operating_mode=5)
m2.shutdown()
