import time
import actionlib
from ndx_manipulation.msg import RotaryGripperCommandAction, RotaryGripperCommandGoal


def grasp_rotary(open_offset=4000):
    # Rotary gripper client
    rotary_client = actionlib.SimpleActionClient('gripper_rotary', RotaryGripperCommandAction)
    print("Waiting for rotary gripper action server...")
    rotary_client.wait_for_server()
    print("Server found")

    # Open gripper a bit
    rotary_client.send_goal(RotaryGripperCommandGoal(type='open', offset=open_offset, effort=200))
    rotary_client.wait_for_result()
    time.sleep(2)

    # Close gripper
    rotary_client.send_goal(RotaryGripperCommandGoal(type='close', offset=0, effort=200))
    rotary_client.wait_for_result()


def release_rotary(offset=4000):
    # Rotary gripper client
    rotary_client = actionlib.SimpleActionClient('gripper_rotary', RotaryGripperCommandAction)
    print("Waiting for rotary gripper action server...")
    rotary_client.wait_for_server()
    print("Server found")

    # Open gripper
    rotary_client.send_goal(RotaryGripperCommandGoal(type='open', offset=offset, effort=200))
    rotary_client.wait_for_result()
