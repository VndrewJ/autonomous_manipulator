# Install script for directory: /home/akoh751/autonomous_assembly_robot/rgmc/src/ndx_manipulation

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/akoh751/autonomous_assembly_robot/rgmc/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/akoh751/autonomous_assembly_robot/rgmc/build/ndx_manipulation/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ndx_manipulation/action" TYPE FILE FILES
    "/home/akoh751/autonomous_assembly_robot/rgmc/src/ndx_manipulation/action/GripperCommand.action"
    "/home/akoh751/autonomous_assembly_robot/rgmc/src/ndx_manipulation/action/RotaryGripperCommand.action"
    "/home/akoh751/autonomous_assembly_robot/rgmc/src/ndx_manipulation/action/TFGCommand.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ndx_manipulation/msg" TYPE FILE FILES
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/GripperCommandAction.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/GripperCommandActionGoal.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/GripperCommandActionResult.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/GripperCommandActionFeedback.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/GripperCommandGoal.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/GripperCommandResult.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/GripperCommandFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ndx_manipulation/msg" TYPE FILE FILES
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/RotaryGripperCommandAction.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/RotaryGripperCommandActionGoal.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/RotaryGripperCommandActionResult.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/RotaryGripperCommandActionFeedback.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/RotaryGripperCommandGoal.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/RotaryGripperCommandResult.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/RotaryGripperCommandFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ndx_manipulation/msg" TYPE FILE FILES
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/TFGCommandAction.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/TFGCommandActionGoal.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/TFGCommandActionResult.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/TFGCommandActionFeedback.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/TFGCommandGoal.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/TFGCommandResult.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/ndx_manipulation/msg/TFGCommandFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ndx_manipulation/cmake" TYPE FILE FILES "/home/akoh751/autonomous_assembly_robot/rgmc/build/ndx_manipulation/catkin_generated/installspace/ndx_manipulation-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/akoh751/autonomous_assembly_robot/rgmc/devel/include/ndx_manipulation")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/roseus/ros/ndx_manipulation")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/common-lisp/ros/ndx_manipulation")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/gennodejs/ros/ndx_manipulation")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/akoh751/autonomous_assembly_robot/rgmc/devel/lib/python3/dist-packages/ndx_manipulation")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/akoh751/autonomous_assembly_robot/rgmc/devel/lib/python3/dist-packages/ndx_manipulation" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/akoh751/autonomous_assembly_robot/rgmc/devel/lib/python3/dist-packages/ndx_manipulation" FILES_MATCHING REGEX "/home/akoh751/autonomous_assembly_robot/rgmc/devel/lib/python3/dist-packages/ndx_manipulation/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/akoh751/autonomous_assembly_robot/rgmc/build/ndx_manipulation/catkin_generated/installspace/ndx_manipulation.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ndx_manipulation/cmake" TYPE FILE FILES "/home/akoh751/autonomous_assembly_robot/rgmc/build/ndx_manipulation/catkin_generated/installspace/ndx_manipulation-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ndx_manipulation/cmake" TYPE FILE FILES
    "/home/akoh751/autonomous_assembly_robot/rgmc/build/ndx_manipulation/catkin_generated/installspace/ndx_manipulationConfig.cmake"
    "/home/akoh751/autonomous_assembly_robot/rgmc/build/ndx_manipulation/catkin_generated/installspace/ndx_manipulationConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ndx_manipulation" TYPE FILE FILES "/home/akoh751/autonomous_assembly_robot/rgmc/src/ndx_manipulation/package.xml")
endif()

