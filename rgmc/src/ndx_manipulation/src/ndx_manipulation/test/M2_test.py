import time
import sys
sys.path.extend(['../', '../../'])
from ndx_manipulation import M2_XM430


# Parameters
manipulation_type = 'cube_roll'
manipulation_loops = 3
grasp_current = 300
recalibrate = False
position_threshold = 25

# Define hand
m2 = M2_XM430.M2_XM430('/dev/ttyUSB0', 1, 2, default_velocity=15)

# Calibrate hand
m2.calibrate(recalibrate=recalibrate)

# Move to pre-grasp position
m2.move_to_goal_position([m2.inner.min_pos, m2.outer.min_pos], tolerance=position_threshold)

# Grasp object
m2.grasp(grasp_current, priority='inner', speed=25)
time.sleep(2)

# Get motor positions in grasped state
current_pos = m2.get_positions()
i_init = current_pos[0]
o_init = current_pos[1]

# Define manipulation waypoints
manipulation_sets = {
    'cylinder_roll': [
        {'pos': [i_init - 700, o_init + 1100], 'speed': [15, 30], 'current': [400, 400]},
        {'pos': [i_init, o_init-100], 'speed': [15, 30], 'current': [400, 400]},
    ],
    'sphere_roll': [
        {'pos': [i_init - 600, o_init + 1000], 'speed': [15, 30], 'current': [400, 400]},
        {'pos': [i_init, o_init-100], 'speed': [15, 30], 'current': [400, 400]},
    ],
    'cube_roll': [
        {'pos': [i_init - 700, o_init + 1000], 'speed': [15, 30], 'current': [400, 400]},
        {'pos': [i_init, o_init-100], 'speed': [15, 30], 'current': [400, 400]},
    ]
}
waypoints = manipulation_sets[manipulation_type]

# Loop through waypoints
waypoint_idx = 0
for i in range(manipulation_loops*len(waypoints)):
    # Set goal waypoint
    goal = waypoints[waypoint_idx]

    # Move to goal position
    m2.move_to_goal_position(pos_lst=goal['pos'], speed_lst=goal['speed'], curr_lst=goal['current'],
                             tolerance=position_threshold, verbose=True)

    # Set new waypoint
    waypoint_idx += 1
    if waypoint_idx > len(waypoints)-1:
        waypoint_idx = 0

# Disable torque and disconnect motors
time.sleep(2)
m2.shutdown()
