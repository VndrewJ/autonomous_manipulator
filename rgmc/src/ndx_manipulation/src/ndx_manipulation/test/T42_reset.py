import sys
sys.path.extend(['../', '../../'])
from ndx_manipulation import T42_XM430


# Define hand
m2 = T42_XM430.T42_XM430('/dev/ttyUSB0', 1, 2, operating_mode=5)
m2.shutdown()
