execute_process(COMMAND "/home/mechp4p/autonomous_manipulator/rgmc/build_isolated/ndx_manipulation/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/mechp4p/autonomous_manipulator/rgmc/build_isolated/ndx_manipulation/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
