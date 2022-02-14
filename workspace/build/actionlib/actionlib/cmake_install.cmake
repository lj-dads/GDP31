# Install script for directory: /home/louis/GDP31/workspace/src/actionlib/actionlib

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/louis/GDP31/workspace/install")
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
  include("/home/louis/GDP31/workspace/build/actionlib/actionlib/catkin_generated/safe_execute_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib/action" TYPE FILE FILES
    "/home/louis/GDP31/workspace/src/actionlib/actionlib/action/Test.action"
    "/home/louis/GDP31/workspace/src/actionlib/actionlib/action/TestRequest.action"
    "/home/louis/GDP31/workspace/src/actionlib/actionlib/action/TwoInts.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib/msg" TYPE FILE FILES
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestAction.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestActionGoal.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestActionResult.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestActionFeedback.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestGoal.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestResult.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib/msg" TYPE FILE FILES
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestRequestAction.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestRequestActionGoal.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestRequestActionResult.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestRequestActionFeedback.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestRequestGoal.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestRequestResult.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TestRequestFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib/msg" TYPE FILE FILES
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TwoIntsAction.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TwoIntsActionGoal.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TwoIntsActionResult.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TwoIntsActionFeedback.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TwoIntsGoal.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TwoIntsResult.msg"
    "/home/louis/GDP31/workspace/devel/share/actionlib/msg/TwoIntsFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib/cmake" TYPE FILE FILES "/home/louis/GDP31/workspace/build/actionlib/actionlib/catkin_generated/installspace/actionlib-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/louis/GDP31/workspace/devel/include/actionlib")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/louis/GDP31/workspace/devel/share/roseus/ros/actionlib")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/louis/GDP31/workspace/devel/share/common-lisp/ros/actionlib")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/louis/GDP31/workspace/devel/share/gennodejs/ros/actionlib")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/louis/GDP31/workspace/devel/lib/python2.7/dist-packages/actionlib")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/louis/GDP31/workspace/devel/lib/python2.7/dist-packages/actionlib" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/louis/GDP31/workspace/devel/lib/python2.7/dist-packages/actionlib" FILES_MATCHING REGEX "/home/louis/GDP31/workspace/devel/lib/python2.7/dist-packages/actionlib/.+/__init__.pyc?$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/louis/GDP31/workspace/build/actionlib/actionlib/catkin_generated/installspace/actionlib.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib/cmake" TYPE FILE FILES "/home/louis/GDP31/workspace/build/actionlib/actionlib/catkin_generated/installspace/actionlib-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib/cmake" TYPE FILE FILES
    "/home/louis/GDP31/workspace/build/actionlib/actionlib/catkin_generated/installspace/actionlibConfig.cmake"
    "/home/louis/GDP31/workspace/build/actionlib/actionlib/catkin_generated/installspace/actionlibConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/actionlib" TYPE FILE FILES "/home/louis/GDP31/workspace/src/actionlib/actionlib/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libactionlib.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libactionlib.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libactionlib.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/louis/GDP31/workspace/devel/lib/libactionlib.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libactionlib.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libactionlib.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libactionlib.so"
         OLD_RPATH "/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libactionlib.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/actionlib" TYPE DIRECTORY FILES "/home/louis/GDP31/workspace/src/actionlib/actionlib/include/actionlib/" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/louis/GDP31/workspace/build/actionlib/actionlib/test/cmake_install.cmake")

endif()

