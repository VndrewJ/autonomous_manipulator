# Install script for directory: /home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation

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
  include("/home/akoh751/autonomous_assembly_robot/rgmc/build/rgmc_manipulation/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rgmc_manipulation/srv" TYPE FILE FILES "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/srv/NFSRequest.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rgmc_manipulation/action" TYPE FILE FILES "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/action/ParallelSpinPadsGripperCommand.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rgmc_manipulation/msg" TYPE FILE FILES
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandAction.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionGoal.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionResult.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandActionFeedback.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandGoal.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandResult.msg"
    "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/rgmc_manipulation/msg/ParallelSpinPadsGripperCommandFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rgmc_manipulation/cmake" TYPE FILE FILES "/home/akoh751/autonomous_assembly_robot/rgmc/build/rgmc_manipulation/catkin_generated/installspace/rgmc_manipulation-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/akoh751/autonomous_assembly_robot/rgmc/devel/include/rgmc_manipulation")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/roseus/ros/rgmc_manipulation")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/common-lisp/ros/rgmc_manipulation")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/akoh751/autonomous_assembly_robot/rgmc/devel/share/gennodejs/ros/rgmc_manipulation")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/akoh751/autonomous_assembly_robot/rgmc/devel/lib/python3/dist-packages/rgmc_manipulation")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/akoh751/autonomous_assembly_robot/rgmc/devel/lib/python3/dist-packages/rgmc_manipulation" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/akoh751/autonomous_assembly_robot/rgmc/devel/lib/python3/dist-packages/rgmc_manipulation" FILES_MATCHING REGEX "/home/akoh751/autonomous_assembly_robot/rgmc/devel/lib/python3/dist-packages/rgmc_manipulation/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/akoh751/autonomous_assembly_robot/rgmc/build/rgmc_manipulation/catkin_generated/installspace/rgmc_manipulation.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rgmc_manipulation/cmake" TYPE FILE FILES "/home/akoh751/autonomous_assembly_robot/rgmc/build/rgmc_manipulation/catkin_generated/installspace/rgmc_manipulation-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rgmc_manipulation/cmake" TYPE FILE FILES
    "/home/akoh751/autonomous_assembly_robot/rgmc/build/rgmc_manipulation/catkin_generated/installspace/rgmc_manipulationConfig.cmake"
    "/home/akoh751/autonomous_assembly_robot/rgmc/build/rgmc_manipulation/catkin_generated/installspace/rgmc_manipulationConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rgmc_manipulation" TYPE FILE FILES "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/package.xml")
endif()

