# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ndx_manipulation: 21 messages, 0 services")

set(MSG_I_FLAGS "-Indx_manipulation:/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ndx_manipulation_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandAction.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandAction.msg" "std_msgs/Header:actionlib_msgs/GoalID:ndx_manipulation/GripperCommandGoal:actionlib_msgs/GoalStatus:ndx_manipulation/GripperCommandActionGoal:ndx_manipulation/GripperCommandResult:ndx_manipulation/GripperCommandActionResult:ndx_manipulation/GripperCommandActionFeedback:ndx_manipulation/GripperCommandFeedback"
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg" "std_msgs/Header:ndx_manipulation/GripperCommandGoal:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg" "std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:ndx_manipulation/GripperCommandResult"
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg" "std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:ndx_manipulation/GripperCommandFeedback"
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg" ""
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg" ""
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg" ""
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandAction.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandAction.msg" "std_msgs/Header:ndx_manipulation/RotaryGripperCommandActionFeedback:actionlib_msgs/GoalID:ndx_manipulation/RotaryGripperCommandGoal:ndx_manipulation/RotaryGripperCommandActionResult:actionlib_msgs/GoalStatus:ndx_manipulation/RotaryGripperCommandResult:ndx_manipulation/RotaryGripperCommandFeedback:ndx_manipulation/RotaryGripperCommandActionGoal"
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg" "std_msgs/Header:ndx_manipulation/RotaryGripperCommandGoal:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg" "std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:ndx_manipulation/RotaryGripperCommandResult"
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg" "std_msgs/Header:ndx_manipulation/RotaryGripperCommandFeedback:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg" ""
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg" ""
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg" ""
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandAction.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandAction.msg" "std_msgs/Header:ndx_manipulation/TFGCommandActionFeedback:actionlib_msgs/GoalID:ndx_manipulation/TFGCommandActionResult:actionlib_msgs/GoalStatus:ndx_manipulation/TFGCommandResult:ndx_manipulation/TFGCommandActionGoal:ndx_manipulation/TFGCommandFeedback:ndx_manipulation/TFGCommandGoal"
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg" "std_msgs/Header:actionlib_msgs/GoalID:ndx_manipulation/TFGCommandGoal"
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg" "std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:ndx_manipulation/TFGCommandResult"
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg" "std_msgs/Header:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:ndx_manipulation/TFGCommandFeedback"
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg" ""
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg" ""
)

get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg" NAME_WE)
add_custom_target(_ndx_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ndx_manipulation" "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_cpp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
)

### Generating Services

### Generating Module File
_generate_module_cpp(ndx_manipulation
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ndx_manipulation_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ndx_manipulation_generate_messages ndx_manipulation_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_cpp _ndx_manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ndx_manipulation_gencpp)
add_dependencies(ndx_manipulation_gencpp ndx_manipulation_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ndx_manipulation_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_eus(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
)

### Generating Services

### Generating Module File
_generate_module_eus(ndx_manipulation
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ndx_manipulation_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ndx_manipulation_generate_messages ndx_manipulation_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_eus _ndx_manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ndx_manipulation_geneus)
add_dependencies(ndx_manipulation_geneus ndx_manipulation_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ndx_manipulation_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_lisp(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
)

### Generating Services

### Generating Module File
_generate_module_lisp(ndx_manipulation
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ndx_manipulation_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ndx_manipulation_generate_messages ndx_manipulation_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_lisp _ndx_manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ndx_manipulation_genlisp)
add_dependencies(ndx_manipulation_genlisp ndx_manipulation_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ndx_manipulation_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_nodejs(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ndx_manipulation
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ndx_manipulation_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ndx_manipulation_generate_messages ndx_manipulation_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_nodejs _ndx_manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ndx_manipulation_gennodejs)
add_dependencies(ndx_manipulation_gennodejs ndx_manipulation_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ndx_manipulation_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)
_generate_msg_py(ndx_manipulation
  "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
)

### Generating Services

### Generating Module File
_generate_module_py(ndx_manipulation
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ndx_manipulation_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ndx_manipulation_generate_messages ndx_manipulation_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/GripperCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandAction.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandGoal.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandResult.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mechp4p/autonomous_manipulator/rgmc/devel_isolated/ndx_manipulation/share/ndx_manipulation/msg/TFGCommandFeedback.msg" NAME_WE)
add_dependencies(ndx_manipulation_generate_messages_py _ndx_manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ndx_manipulation_genpy)
add_dependencies(ndx_manipulation_genpy ndx_manipulation_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ndx_manipulation_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ndx_manipulation
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ndx_manipulation_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(ndx_manipulation_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ndx_manipulation
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ndx_manipulation_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(ndx_manipulation_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ndx_manipulation
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ndx_manipulation_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(ndx_manipulation_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ndx_manipulation
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ndx_manipulation_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(ndx_manipulation_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  string(REGEX REPLACE "([][+.*()^])" "\\\\\\1" ESCAPED_PATH "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation")
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ndx_manipulation
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${ESCAPED_PATH}/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ndx_manipulation_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(ndx_manipulation_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
