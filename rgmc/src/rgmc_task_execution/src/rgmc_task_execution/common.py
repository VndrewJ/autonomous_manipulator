import rospy
import numpy as np
from ndx_util.tf_util import get_pose, tarray_to_tmsg, tarray_to_posemsg
from ndx_util.NdxArm import NdxArm
from actionlib import SimpleActionClient

# from rgmc_manipulation.msg import (
#     ParallelSpinPadsGripperCommandGoal,
# )
from ndx_manipulation.msg import (
    GripperCommandGoal,
)
from tf2_ros import TransformBroadcaster
import dynamic_reconfigure.client


def disable_compliance(func_handle):
    func_handle(
        start_controllers=["pos_joint_traj_controller"],
        stop_controllers=["cartesian_compliance_controller"],
        strictness=2,
        start_asap=True,
    )
    rospy.sleep(1)


def enable_compliance(func_handle):
    func_handle(
        start_controllers=[
            "cartesian_compliance_controller",
        ],
        stop_controllers=[
            "pos_joint_traj_controller",
        ],
        strictness=2,
        start_asap=True,
    )
    rospy.sleep(1)


def spiral_down(
    tf_publisher,
    initial_pos,
    initial_radius,
    final_radius,
    depth,
    jump_size,
    angle_step_size,
    output_tf_name="ur5e_A_target_pose",
    base_link="ur5e_A/base_link",
):
    # radius = 0.01
    # depth = 0.05
    # jump_size = -0.005
    cur_pos = initial_pos.copy()
    tf_pub = TransformBroadcaster()
    no_of_jumps = int(abs(depth / jump_size))
    radius_increment = (final_radius - initial_radius) / (
        np.arange(0, 360, angle_step_size).shape[0]
    )
    for _ in range(no_of_jumps):
        curr_radius = initial_radius
        for angle in np.arange(0, 360, angle_step_size):
            cur_pos[0, 3] = initial_pos[0, 3] + curr_radius * np.cos(
                np.deg2rad(angle)
            )
            cur_pos[1, 3] = initial_pos[1, 3] + curr_radius * np.sin(
                np.deg2rad(angle)
            )
            cur_pos[2, 3] += jump_size / (360 / angle_step_size)
            tf_pub.sendTransform(
                tarray_to_tmsg(cur_pos, base_link, output_tf_name)
            )
            curr_radius += radius_increment
            rospy.sleep(0.01)


def apply_roll(
    pose: np.ndarray, angle: float, is_deg: bool = True
) -> np.ndarray:
    if is_deg:
        angle = np.deg2rad(angle)
    rot_mat = np.array(
        [
            [1, 0, 0, 0],
            [0, np.cos(angle), -np.sin(angle), 0],
            [0, np.sin(angle), np.cos(angle), 0],
            [0, 0, 0, 1],
        ]
    )
    return np.dot(rot_mat, pose)


def apply_pitch(
    pose: np.ndarray, angle: float, is_deg: bool = True
) -> np.ndarray:
    if is_deg:
        angle = np.deg2rad(angle)
    rot_mat = np.array(
        [
            [np.cos(angle), 0, np.sin(angle), 0],
            [0, 1, 0, 0],
            [-np.sin(angle), 0, np.cos(angle), 0],
            [0, 0, 0, 1],
        ]
    )
    return np.dot(rot_mat, pose)


def apply_yaw(
    pose: np.ndarray, angle: float, is_deg: bool = True
) -> np.ndarray:
    if is_deg:
        angle = np.deg2rad(angle)
    rot_mat = np.array(
        [
            [np.cos(angle), -np.sin(angle), 0, 0],
            [np.sin(angle), np.cos(angle), 0, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1],
        ]
    )
    return np.dot(rot_mat, pose)


def align_gripper_axis(X_is: np.ndarray, Z_is: np.ndarray) -> np.ndarray:
    H_gripp_align = np.eye(4)
    # Gripper X is X_is
    H_gripp_align[:3, 0] = X_is
    # Gripper Z is Z_is
    H_gripp_align[:3, 2] = Z_is
    # Gripper Y is the cross p. between X and Z
    H_gripp_align[:3, 1] = np.cross(Z_is, X_is)
    return H_gripp_align


def pick(
    object_tf_name: str,
    arm: NdxArm,
    gripper: SimpleActionClient,
    func_switch_ctrl: rospy.ServiceProxy,
    pre_pick_offset: np.ndarray = None,
    pre_pick_pad_angle: float = 0.0,
    pick_offset: np.ndarray = None,
    post_pick_offset: np.ndarray = None,
    H_gripp_align: np.ndarray = None,
    post_pick_pad_angle: float = 0.0,
    picking_apperture=0.04,
    picking_close_dist=0.005,
    picking_current=100,
    actuate_pads=True,
):
    disable_compliance(func_switch_ctrl)

    if pre_pick_offset is None:
        pre_pick_offset = np.array([0, 0, 0.1])
    if pick_offset is None:
        pick_offset = np.zeros(3)
    if post_pick_offset is None:
        post_pick_offset = pre_pick_offset.copy()

    # if actuate_pads:
    # gripper.send_goal_and_wait(
    #     ParallelSpinPadsGripperCommandGoal(
    #         pads_target_pos=np.deg2rad(pre_pick_pad_angle),
    #         par_max_effort=300,
    #         par_velocity=50,
    #         actuate_parallel=False,
    #         actuate_pads=True,
    #     )
    # )

    if not arm.set_planning_frame(object_tf_name, max_wait_time=30):
        rospy.logerr("Could not find object in scene. Aborting...")
        return False

    # If no alligning is passed, we consider the gripper pointing down for picking
    if H_gripp_align is None:
        # # Transform to make gripper Z and Y align with object's X and Y
        # H_gripp_align = np.eye(4)
        # # Gripper Z is object's X
        # H_gripp_align[:3, 2] = np.array([1, 0, 0])
        # # Gripper Y is object's Y
        # H_gripp_align[:3, 1] = np.array([0, 1, 0])
        # # Gripper X is object's cross Y and Z
        # H_gripp_align[:3, 0] = np.cross(
        #     H_gripp_align[:3, 1], H_gripp_align[:3, 2]
        # )
        H_gripp_align = align_gripper_axis(
            X_is=np.array([0, 0, -1]), Z_is=np.array([1, 0, 0])
        )

    # Coping so we can manipulate w/o changing the array
    pre_grasp = H_gripp_align.copy()

    pre_grasp[:3, 3] += pre_pick_offset
    # pre_grasp[2, 3] = 0.10
    tf_pub = TransformBroadcaster()
    # prepared_pose = arm.prepare_pose(pre_grasp, object_tf_name)
    # br.sendTransform(
    #     tarray_to_tmsg(prepared_pose, arm.mvit_planning_frame, "next_pose")
    # )
    # quit()
    # br.sendTransform(tarray_to_tmsg(pre_grasp, "world", "next_pose"))
    print(pre_grasp)
    tf_pub.sendTransform(
        tarray_to_tmsg(pre_grasp, object_tf_name, "next_pose")
    )
    # quit()
    if not arm.set_tool_pose(pre_grasp):
        rospy.logerr("Could not reach pose, aborting")
        return False
    gripper.send_goal_and_wait(
        GripperCommandGoal(
            position=picking_apperture,
            max_effort=picking_current,
            velocity=50,
        )
    )
    # gripper.send_goal_and_wait(
    #     ParallelSpinPadsGripperCommandGoal(
    #         par_target_pos=picking_apperture,
    #         par_max_effort=picking_current,
    #         par_velocity=50,
    #         actuate_parallel=True,
    #         actuate_pads=False,
    #     )
    # )

    grasp = H_gripp_align.copy()
    # grasp[0, 3] = 0.03
    grasp[:3, 3] += pick_offset

    # br.sendTransform(tarray_to_tmsg(grasp, object_tf_name, "next_pose"))
    if not arm.set_tool_pose(grasp):
        rospy.logerr("Could not reach pose, aborting")
        return False
    # quit()
    gripper.send_goal_and_wait(
        GripperCommandGoal(
            position=picking_close_dist,
            max_effort=picking_current,
            velocity=50,
        )
    )
    # gripper.send_goal_and_wait(
    #     ParallelSpinPadsGripperCommandGoal(
    #         par_target_pos=picking_close_dist,
    #         par_max_effort=picking_current,
    #         par_velocity=50,
    #         actuate_parallel=True,
    #         actuate_pads=False,
    #     )
    # )

    post_pick = H_gripp_align.copy()
    post_pick[:3, 3] += post_pick_offset
    if not arm.set_tool_pose(post_pick):
        rospy.logerr("Could not reach pose, aborting")
        return False

    if actuate_pads and pre_pick_pad_angle != post_pick_pad_angle:
        gripper.send_goal_and_wait(
            GripperCommandGoal(
                position=picking_close_dist,
                max_effort=picking_current,
                velocity=50,
            )
        )
        # gripper.send_goal_and_wait(
        #     ParallelSpinPadsGripperCommandGoal(
        #         pads_target_pos=np.deg2rad(post_pick_pad_angle),
        #         par_max_effort=300,
        #         par_velocity=50,
        #         actuate_parallel=False,
        #         actuate_pads=True,
        #     )
        # )

    return True


def place(
    object_tf_name: str,
    arm: NdxArm,
    gripper: SimpleActionClient,
    func_switch_ctrl: rospy.ServiceProxy,
    compliance_target_pub,
    pre_place_offset: np.ndarray = None,
    post_place_offset: np.ndarray = None,
    pre_place_pad_angle: float = 0.0,
    compliance_radius=0.0025,
    final_compliance_radius=None,
    compliance_depth=0.05,
    compliance_jump_size=-0.005,
    compliance_angle_step_size=15,
    parallel_open_aperture=0.04,
    pre_compliance_offset: np.ndarray = None,
    H_gripp_align: np.ndarray = None,
    compliant_push=None,
    compliant_push_offset=None,
    compliance_tool_frame="ur5e_A_fingertip",
    compliance_base_link="ur5e_A/base_link",
    xy_stiffness=300,
    z_stiffness=1000,
    bump_stiffness=4000,
    compliant_pads_offset=None,
    compliant_pads_current=300,
    compliant_pads_spd=15,
):
    # if pre_place_offset is None:
    #     pre_place_offset = np.array([0, 0, 0.1])
    # if post_place_offset is None:
    #     post_place_offset = pre_place_offset

    # gripper.send_goal_and_wait(
    #     ParallelSpinPadsGripperCommandGoal(
    #         pads_target_pos=np.deg2rad(pre_place_pad_angle),
    #         pads_max_effort=compliant_pads_current,
    #         pads_velocity=50,
    #         actuate_parallel=False,
    #         actuate_pads=True,
    #     )
    # )

    if not arm.set_planning_frame(object_tf_name, max_wait_time=30):
        rospy.logerr("Could not find objects transform in scene. Aborting...")
        return False

    # If no alligning is passed, we consider the gripper pointing down for picking
    if H_gripp_align is None:
        # Transform to make gripper Z and Y align with object's X and Y
        H_gripp_align = np.eye(4)
        # Gripper Z is object's X
        H_gripp_align[:3, 2] = np.array([1, 0, 0])
        # Gripper Y is object's Y
        H_gripp_align[:3, 1] = np.array([0, 1, 0])
        # Gripper X is object's cross Y and Z
        H_gripp_align[:3, 0] = np.cross(
            H_gripp_align[:3, 1], H_gripp_align[:3, 2]
        )

    tf_pub = TransformBroadcaster()
    if pre_place_offset is not None:
        # Coping so we can manipulate w/o changing the array
        pre_place_pose = H_gripp_align.copy()
        pre_place_pose[:3, 3] += pre_place_offset

        tf_pub.sendTransform(
            tarray_to_tmsg(pre_place_pose, object_tf_name, "next_pose")
        )

        # Moving to pre-place
        arm.set_tool_pose(pre_place_pose)

    if pre_compliance_offset is not None:
        # Coping so we can manipulate w/o changing the array
        pre_compliance_pose = H_gripp_align.copy()
        pre_compliance_pose[:3, 3] += pre_compliance_offset

        # Moving to pre-compliance
        arm.set_tool_pose(pre_compliance_pose)

    # Switching to compliance controller
    # return False
    if compliance_depth != 0:
        service_str = "/ur5e_A/cartesian_compliance_controller/stiffness"
        client = dynamic_reconfigure.client.Client(service_str)

        (
            initial_pos,
            _,
            _,
            _,
        ) = get_pose(
            tf_buffer=arm.tf_buffer,
            reference_frame=compliance_base_link,
            frame=compliance_tool_frame,
            time=rospy.Time.now(),
            max_wait_time=5,
        )
        if initial_pos is None:
            rospy.logerr(
                "Could not find tool initial pose for compliance. Aborting..."
            )
            return False
        enable_compliance(func_switch_ctrl)
        prev_xy_stiffness = rospy.get_param(
            "/ur5e_A/cartesian_compliance_controller/stiffness/trans_x"
        )
        prev_z_stiffness = rospy.get_param(
            "/ur5e_A/cartesian_compliance_controller/stiffness/trans_z"
        )

        params = {
            "trans_x": xy_stiffness,
            "trans_y": xy_stiffness,
            "trans_z": z_stiffness,
        }
        client.update_configuration(params)

        if final_compliance_radius is None:
            final_compliance_radius = compliance_radius
        spiral_down(
            compliance_target_pub,
            initial_pos,
            initial_radius=compliance_radius,
            final_radius=final_compliance_radius,
            depth=compliance_depth,
            jump_size=compliance_jump_size,
            angle_step_size=compliance_angle_step_size,
        )
        if compliant_pads_offset is not None:
            # gripper.send_goal_and_wait(
            # ParallelSpinPadsGripperCommandGoal(
            #     pads_target_pos=np.deg2rad(compliant_pads_offset),
            #     pads_max_effort=compliant_pads_current,
            #     pads_velocity=compliant_pads_spd,
            #     actuate_parallel=False,
            #     actuate_pads=True,
            #     reverse_pads_actuation=True,
            # )
            # )
            rospy.sleep(1)

    if post_place_offset is not None:
        gripper.send_goal_and_wait(
            GripperCommandGoal(
                position=parallel_open_aperture, max_effort=100, velocity=50
            )
            # ParallelSpinPadsGripperCommandGoal(
            #     par_target_pos=parallel_open_aperture,
            #     par_max_effort=100,
            #     par_velocity=50,
            #     actuate_parallel=True,
            #     actuate_pads=False,
            # )
        )
        if compliant_pads_offset is not None:
            pass
            # gripper.send_goal_and_wait(
            #     ParallelSpinPadsGripperCommandGoal(
            #         pads_target_pos=0,
            #         pads_max_effort=compliant_pads_current,
            #         pads_velocity=15,
            #         actuate_parallel=False,
            #         actuate_pads=True,
            #         reverse_pads_actuation=True,
            #     )
            # )
        if compliance_depth != 0:
            compliance_target_pub.publish(
                tarray_to_posemsg(initial_pos, "ur5e_A/base_link")
            )
            rospy.sleep(4)

    if compliant_push is not None:
        push_target = initial_pos.copy()
        push_target[:3, 3] += compliant_push_offset
        compliance_target_pub.publish(
            tarray_to_posemsg(push_target, "ur5e_A/base_link")
        )
        rospy.sleep(4)
        # gripper.send_goal_and_wait(
        #     ParallelSpinPadsGripperCommandGoal(
        #         pads_target_pos=np.deg2rad(0),
        #         par_max_effort=300,
        #         par_velocity=50,
        #         actuate_parallel=False,
        #         actuate_pads=True,
        #     )
        # )
        gripper.send_goal_and_wait(
            GripperCommandGoal(
                position=0.005,
                max_effort=100,
                velocity=50,
            )
            # ParallelSpinPadsGripperCommandGoal(
            #     par_target_pos=0.005,
            #     par_max_effort=100,
            #     par_velocity=50,
            #     actuate_parallel=True,
            #     actuate_pads=False,
            # )
        )
        # gripper.send_goal_and_wait(
        #     ParallelSpinPadsGripperCommandGoal(
        #         par_target_pos=0.005,
        #         par_max_effort=100,
        #         par_velocity=50,
        #         actuate_parallel=True,
        #         actuate_pads=False,
        #     )
        # )

        rospy.set_param(
            "/ur5e_A/cartesian_compliance_controller/stiffness/trans_z",
            bump_stiffness,
        )
        rospy.sleep(0.5)
        push_target[2, 3] += compliant_push
        compliance_target_pub.publish(
            tarray_to_posemsg(push_target, "ur5e_A/base_link")
        )
        rospy.sleep(3.2)
    if compliance_depth != 0:
        # rospy.set_param(
        #     "/ur5e_A/cartesian_compliance_controller/stiffness/trans_x",
        #     prev_xy_stiffness,
        # )
        # rospy.set_param(
        #     "/ur5e_A/cartesian_compliance_controller/stiffness/trans_y",
        #     prev_xy_stiffness,
        # )
        # rospy.set_param(
        #     "/ur5e_A/cartesian_compliance_controller/stiffness/trans_z",
        #     prev_z_stiffness,
        # )
        params = {
            "trans_x": prev_xy_stiffness,
            "trans_y": prev_xy_stiffness,
            "trans_z": prev_z_stiffness,
        }
        client.update_configuration(params)
    if post_place_offset is not None:
        # Moving to pre-place
        disable_compliance(func_switch_ctrl)
        # Coping so we can manipulate w/o changing the array
        post_place_pose = H_gripp_align.copy()
        post_place_pose[:3, 3] += post_place_offset

        arm.set_tool_pose(post_place_pose)


def actuate_rotary_gripper(
    rotary_server, torque, speed, duration, wait_finish=True
):
    if abs(speed) != 0 and abs(torque) != 0:
        rotary_server(speed, torque, True, False, False, False)
        rotary_server(speed, torque, False, True, False, False)
    if wait_finish:
        rospy.sleep(duration)
        rotary_server(speed, torque, False, False, True, False)


def add_table(scene):
    T_world_table = np.eye(4)
    T_world_table[1, 3] -= 0.1
    T_world_table[2, 3] -= 0.05 / 2
    T_world_table[2, 3] -= 0.01

    scene.add_box(
        "table",
        tarray_to_posemsg(T_world_table, "world"),
        (2, 0.8, 0.05),
    )
