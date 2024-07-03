# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rgmc_manipulation: 7 messages, 1 services")

set(MSG_I_FLAGS "-Irgmc_manipulation:/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rgmc_manipulation_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandAction.msg" NAME_WE)
add_custom_target(_rgmc_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rgmc_manipulation" "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandAction.msg" "rgmc_manipulation/ParallelSpinPadsGripperCommandResult:rgmc_manipulation/ParallelSpinPadsGripperCommandGoal:actionlib_msgs/GoalStatus:rgmc_manipulation/ParallelSpinPadsGripperCommandActionGoal:rgmc_manipulation/ParallelSpinPadsGripperCommandActionFeedback:rgmc_manipulation/ParallelSpinPadsGripperCommandFeedback:std_msgs/Header:actionlib_msgs/GoalID:rgmc_manipulation/ParallelSpinPadsGripperCommandActionResult"
)

get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg" NAME_WE)
add_custom_target(_rgmc_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rgmc_manipulation" "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg" "rgmc_manipulation/ParallelSpinPadsGripperCommandGoal:std_msgs/Header:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg" NAME_WE)
add_custom_target(_rgmc_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rgmc_manipulation" "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg" "actionlib_msgs/GoalID:std_msgs/Header:actionlib_msgs/GoalStatus:rgmc_manipulation/ParallelSpinPadsGripperCommandResult"
)

get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg" NAME_WE)
add_custom_target(_rgmc_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rgmc_manipulation" "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg" "actionlib_msgs/GoalID:std_msgs/Header:actionlib_msgs/GoalStatus:rgmc_manipulation/ParallelSpinPadsGripperCommandFeedback"
)

get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg" NAME_WE)
add_custom_target(_rgmc_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rgmc_manipulation" "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg" ""
)

get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg" NAME_WE)
add_custom_target(_rgmc_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rgmc_manipulation" "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg" ""
)

get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg" NAME_WE)
add_custom_target(_rgmc_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rgmc_manipulation" "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg" ""
)

get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/srv/NFSRequest.srv" NAME_WE)
add_custom_target(_rgmc_manipulation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rgmc_manipulation" "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/srv/NFSRequest.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_cpp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_cpp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_cpp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_cpp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_cpp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_cpp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgmc_manipulation
)

### Generating Services
_generate_srv_cpp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/srv/NFSRequest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgmc_manipulation
)

### Generating Module File
_generate_module_cpp(rgmc_manipulation
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgmc_manipulation
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rgmc_manipulation_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rgmc_manipulation_generate_messages rgmc_manipulation_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandAction.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_cpp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_cpp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_cpp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_cpp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_cpp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_cpp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_cpp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/srv/NFSRequest.srv" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_cpp _rgmc_manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rgmc_manipulation_gencpp)
add_dependencies(rgmc_manipulation_gencpp rgmc_manipulation_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rgmc_manipulation_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_eus(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_eus(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_eus(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_eus(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_eus(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_eus(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgmc_manipulation
)

### Generating Services
_generate_srv_eus(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/srv/NFSRequest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgmc_manipulation
)

### Generating Module File
_generate_module_eus(rgmc_manipulation
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgmc_manipulation
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(rgmc_manipulation_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(rgmc_manipulation_generate_messages rgmc_manipulation_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandAction.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_eus _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_eus _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_eus _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_eus _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_eus _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_eus _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_eus _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/srv/NFSRequest.srv" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_eus _rgmc_manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rgmc_manipulation_geneus)
add_dependencies(rgmc_manipulation_geneus rgmc_manipulation_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rgmc_manipulation_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_lisp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_lisp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_lisp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_lisp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_lisp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_lisp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgmc_manipulation
)

### Generating Services
_generate_srv_lisp(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/srv/NFSRequest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgmc_manipulation
)

### Generating Module File
_generate_module_lisp(rgmc_manipulation
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgmc_manipulation
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rgmc_manipulation_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rgmc_manipulation_generate_messages rgmc_manipulation_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandAction.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_lisp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_lisp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_lisp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_lisp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_lisp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_lisp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_lisp _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/srv/NFSRequest.srv" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_lisp _rgmc_manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rgmc_manipulation_genlisp)
add_dependencies(rgmc_manipulation_genlisp rgmc_manipulation_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rgmc_manipulation_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_nodejs(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_nodejs(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_nodejs(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_nodejs(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_nodejs(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_nodejs(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgmc_manipulation
)

### Generating Services
_generate_srv_nodejs(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/srv/NFSRequest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgmc_manipulation
)

### Generating Module File
_generate_module_nodejs(rgmc_manipulation
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgmc_manipulation
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(rgmc_manipulation_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(rgmc_manipulation_generate_messages rgmc_manipulation_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandAction.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_nodejs _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_nodejs _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_nodejs _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_nodejs _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_nodejs _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_nodejs _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_nodejs _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/srv/NFSRequest.srv" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_nodejs _rgmc_manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rgmc_manipulation_gennodejs)
add_dependencies(rgmc_manipulation_gennodejs rgmc_manipulation_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rgmc_manipulation_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandAction.msg"
  "${MSG_I_FLAGS}"
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_py(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_py(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_py(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_py(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_py(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation
)
_generate_msg_py(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation
)

### Generating Services
_generate_srv_py(rgmc_manipulation
  "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/srv/NFSRequest.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation
)

### Generating Module File
_generate_module_py(rgmc_manipulation
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rgmc_manipulation_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rgmc_manipulation_generate_messages rgmc_manipulation_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandAction.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_py _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_py _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_py _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_py _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_py _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_py _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_py _rgmc_manipulation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/srv/NFSRequest.srv" NAME_WE)
add_dependencies(rgmc_manipulation_generate_messages_py _rgmc_manipulation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rgmc_manipulation_genpy)
add_dependencies(rgmc_manipulation_genpy rgmc_manipulation_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rgmc_manipulation_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgmc_manipulation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgmc_manipulation
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(rgmc_manipulation_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(rgmc_manipulation_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgmc_manipulation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgmc_manipulation
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(rgmc_manipulation_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(rgmc_manipulation_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgmc_manipulation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgmc_manipulation
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(rgmc_manipulation_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(rgmc_manipulation_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgmc_manipulation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgmc_manipulation
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(rgmc_manipulation_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(rgmc_manipulation_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  string(REGEX REPLACE "([][+.*()^])" "\\\\\\1" ESCAPED_PATH "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation")
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgmc_manipulation
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${ESCAPED_PATH}/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(rgmc_manipulation_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(rgmc_manipulation_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
