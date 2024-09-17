import time
import sys
sys.path.extend(['../', '../../'])
from ndx_manipulation import T42_XM430


# Parameters
manipulation_object = 'sphere'
manipulation_type = 'z'
manipulation_loops = 3
recalibrate = False
position_threshold = 25

# Parameter influences
grasp_current = 100
if manipulation_type == 'z':
    grasp_current = 200
    if manipulation_object == 'cube':
        grasp_current = 280
elif manipulation_type == 'x':
    grasp_current = 120
    if manipulation_object == 'sphere':
        grasp_current = 140
elif manipulation_type == 'roll':
    grasp_current = 100
manipulation_set = manipulation_object + '_' + manipulation_type

# Define hand
t42 = T42_XM430.T42_XM430('/dev/ttyUSB0', 1, 2, default_velocity=15)

# Calibrate hand
t42.calibrate(recalibrate=recalibrate)

# Move to pre-grasp position
t42.move_to_goal_position([t42.left.min_pos, t42.right.min_pos], tolerance=position_threshold)
if manipulation_type == 'roll':
    t42.move_to_goal_position([t42.left.get_position(), t42.right.max_pos-400], tolerance=position_threshold)

# Grasp object
t42.grasp(grasp_current)
time.sleep(3)

# Get motor positions in grasped state
current_pos = t42.get_positions()
l_init = current_pos[0]
r_init = current_pos[1]

# Define manipulation waypoints for different sets
manipulation_sets = {
    'cylinder_x': [
        {'pos': [l_init - 540, r_init + 560], 'speed': [15, 16], 'current': [300, 300]},
        {'pos': [l_init + 560, r_init - 540], 'speed': [16, 15], 'current': [300, 300]}
    ],
    'cylinder_z': [
        {'pos': [l_init - 300, r_init - 300], 'speed': [10, 10], 'current': [400, 400]},
        {'pos': [l_init - 10, r_init - 10], 'speed': [10, 10], 'current': [400, 400]}
    ],
    'cylinder_roll': [
        {'pos': [l_init, r_init + 500], 'speed': [10, 10], 'current': [400, 400]},
        {'pos': [l_init+50, r_init], 'speed': [10, 10], 'current': [400, 400]},
    ],
    'sphere_x': [
        {'pos': [l_init - 530, r_init + 530], 'speed': [15, 17], 'current': [300, 300]},
        {'pos': [l_init + 530, r_init - 530], 'speed': [17, 15], 'current': [300, 300]}
    ],
    'sphere_z': [
        {'pos': [l_init + 300, r_init + 300], 'speed': [10, 10], 'current': [400, 400]},
        {'pos': [l_init - 10, r_init - 10], 'speed': [10, 10], 'current': [400, 400]}
    ],
    'sphere_roll': [
        {'pos': [l_init, r_init + 500], 'speed': [10, 10], 'current': [400, 400]},
        {'pos': [l_init+50, r_init], 'speed': [10, 10], 'current': [400, 400]},
    ],
    'cube_x': [
        {'pos': [l_init - 530, r_init + 530], 'speed': [15, 18], 'current': [300, 300]},
        {'pos': [l_init + 530, r_init - 530], 'speed': [18, 15], 'current': [300, 300]}
    ],
    'cube_z': [
        {'pos': [l_init - 400, r_init - 400], 'speed': [10, 10], 'current': [400, 400]},
        #{'pos': [l_init + 0, r_init - 200], 'speed': [10, 10], 'current': [400, 400]},
        {'pos': [l_init - 0, r_init - 0], 'speed': [10, 10], 'current': [400, 400]}
    ],
}
waypoints = manipulation_sets[manipulation_set]

# Loop through waypoints
waypoint_idx = 0
for i in range(manipulation_loops*len(waypoints)):
    # Set goal waypoint
    goal = waypoints[waypoint_idx]

    # Move to goal position
    t42.move_to_goal_position(pos_lst=goal['pos'], speed_lst=goal['speed'], curr_lst=goal['current'],
                              tolerance=position_threshold, verbose=True)

    # Set new waypoint
    waypoint_idx += 1
    if waypoint_idx > len(waypoints)-1:
        waypoint_idx = 0

# Disable torque and disconnect motors
time.sleep(3)
t42.shutdown()
