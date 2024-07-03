execute_process(COMMAND "/home/akoh751/autonomous_assembly_robot/rgmc/build/rgmc_manipulation/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/akoh751/autonomous_assembly_robot/rgmc/build/rgmc_manipulation/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
