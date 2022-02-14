execute_process(COMMAND "/home/louis/GDP31/workspace/build/actionlib/actionlib/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/louis/GDP31/workspace/build/actionlib/actionlib/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
