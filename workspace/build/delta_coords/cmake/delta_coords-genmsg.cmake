# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "delta_coords: 7 messages, 1 services")

set(MSG_I_FLAGS "-Idelta_coords:/home/louis/GDP31/workspace/devel/share/delta_coords/msg;-Igeometry_msgs:/home/louis/GDP31/workspace/src/common_msgs/geometry_msgs/msg;-Iactionlib_msgs:/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(delta_coords_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg" NAME_WE)
add_custom_target(_delta_coords_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "delta_coords" "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg" "delta_coords/SendCoordsGoal:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/louis/GDP31/workspace/src/delta_coords/srv/Test.srv" NAME_WE)
add_custom_target(_delta_coords_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "delta_coords" "/home/louis/GDP31/workspace/src/delta_coords/srv/Test.srv" ""
)

get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg" NAME_WE)
add_custom_target(_delta_coords_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "delta_coords" "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg" "actionlib_msgs/GoalStatus:delta_coords/SendCoordsFeedback:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg" NAME_WE)
add_custom_target(_delta_coords_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "delta_coords" "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg" ""
)

get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg" NAME_WE)
add_custom_target(_delta_coords_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "delta_coords" "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg" ""
)

get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg" NAME_WE)
add_custom_target(_delta_coords_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "delta_coords" "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg" "actionlib_msgs/GoalStatus:delta_coords/SendCoordsResult:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg" NAME_WE)
add_custom_target(_delta_coords_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "delta_coords" "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg" ""
)

get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsAction.msg" NAME_WE)
add_custom_target(_delta_coords_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "delta_coords" "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsAction.msg" "delta_coords/SendCoordsActionGoal:actionlib_msgs/GoalID:delta_coords/SendCoordsGoal:delta_coords/SendCoordsActionFeedback:actionlib_msgs/GoalStatus:delta_coords/SendCoordsActionResult:delta_coords/SendCoordsResult:std_msgs/Header:delta_coords/SendCoordsFeedback"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_coords
)
_generate_msg_cpp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_coords
)
_generate_msg_cpp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_coords
)
_generate_msg_cpp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_coords
)
_generate_msg_cpp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_coords
)
_generate_msg_cpp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_coords
)
_generate_msg_cpp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsAction.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_coords
)

### Generating Services
_generate_srv_cpp(delta_coords
  "/home/louis/GDP31/workspace/src/delta_coords/srv/Test.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_coords
)

### Generating Module File
_generate_module_cpp(delta_coords
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_coords
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(delta_coords_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(delta_coords_generate_messages delta_coords_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_cpp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/src/delta_coords/srv/Test.srv" NAME_WE)
add_dependencies(delta_coords_generate_messages_cpp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_cpp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_cpp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_cpp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_cpp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_cpp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsAction.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_cpp _delta_coords_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delta_coords_gencpp)
add_dependencies(delta_coords_gencpp delta_coords_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delta_coords_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_coords
)
_generate_msg_eus(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_coords
)
_generate_msg_eus(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_coords
)
_generate_msg_eus(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_coords
)
_generate_msg_eus(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_coords
)
_generate_msg_eus(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_coords
)
_generate_msg_eus(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsAction.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_coords
)

### Generating Services
_generate_srv_eus(delta_coords
  "/home/louis/GDP31/workspace/src/delta_coords/srv/Test.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_coords
)

### Generating Module File
_generate_module_eus(delta_coords
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_coords
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(delta_coords_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(delta_coords_generate_messages delta_coords_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_eus _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/src/delta_coords/srv/Test.srv" NAME_WE)
add_dependencies(delta_coords_generate_messages_eus _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_eus _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_eus _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_eus _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_eus _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_eus _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsAction.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_eus _delta_coords_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delta_coords_geneus)
add_dependencies(delta_coords_geneus delta_coords_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delta_coords_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_coords
)
_generate_msg_lisp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_coords
)
_generate_msg_lisp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_coords
)
_generate_msg_lisp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_coords
)
_generate_msg_lisp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_coords
)
_generate_msg_lisp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_coords
)
_generate_msg_lisp(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsAction.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_coords
)

### Generating Services
_generate_srv_lisp(delta_coords
  "/home/louis/GDP31/workspace/src/delta_coords/srv/Test.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_coords
)

### Generating Module File
_generate_module_lisp(delta_coords
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_coords
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(delta_coords_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(delta_coords_generate_messages delta_coords_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_lisp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/src/delta_coords/srv/Test.srv" NAME_WE)
add_dependencies(delta_coords_generate_messages_lisp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_lisp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_lisp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_lisp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_lisp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_lisp _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsAction.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_lisp _delta_coords_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delta_coords_genlisp)
add_dependencies(delta_coords_genlisp delta_coords_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delta_coords_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_coords
)
_generate_msg_nodejs(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_coords
)
_generate_msg_nodejs(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_coords
)
_generate_msg_nodejs(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_coords
)
_generate_msg_nodejs(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_coords
)
_generate_msg_nodejs(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_coords
)
_generate_msg_nodejs(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsAction.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_coords
)

### Generating Services
_generate_srv_nodejs(delta_coords
  "/home/louis/GDP31/workspace/src/delta_coords/srv/Test.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_coords
)

### Generating Module File
_generate_module_nodejs(delta_coords
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_coords
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(delta_coords_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(delta_coords_generate_messages delta_coords_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_nodejs _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/src/delta_coords/srv/Test.srv" NAME_WE)
add_dependencies(delta_coords_generate_messages_nodejs _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_nodejs _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_nodejs _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_nodejs _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_nodejs _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_nodejs _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsAction.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_nodejs _delta_coords_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delta_coords_gennodejs)
add_dependencies(delta_coords_gennodejs delta_coords_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delta_coords_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_coords
)
_generate_msg_py(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_coords
)
_generate_msg_py(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_coords
)
_generate_msg_py(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_coords
)
_generate_msg_py(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_coords
)
_generate_msg_py(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_coords
)
_generate_msg_py(delta_coords
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsAction.msg"
  "${MSG_I_FLAGS}"
  "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalID.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg;/home/louis/GDP31/workspace/src/common_msgs/actionlib_msgs/msg/GoalStatus.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_coords
)

### Generating Services
_generate_srv_py(delta_coords
  "/home/louis/GDP31/workspace/src/delta_coords/srv/Test.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_coords
)

### Generating Module File
_generate_module_py(delta_coords
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_coords
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(delta_coords_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(delta_coords_generate_messages delta_coords_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionGoal.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_py _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/src/delta_coords/srv/Test.srv" NAME_WE)
add_dependencies(delta_coords_generate_messages_py _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionFeedback.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_py _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsResult.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_py _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsFeedback.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_py _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsActionResult.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_py _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsGoal.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_py _delta_coords_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/louis/GDP31/workspace/devel/share/delta_coords/msg/SendCoordsAction.msg" NAME_WE)
add_dependencies(delta_coords_generate_messages_py _delta_coords_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delta_coords_genpy)
add_dependencies(delta_coords_genpy delta_coords_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delta_coords_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_coords)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_coords
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(delta_coords_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(delta_coords_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(delta_coords_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_coords)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_coords
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(delta_coords_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(delta_coords_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(delta_coords_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_coords)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_coords
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(delta_coords_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(delta_coords_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(delta_coords_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_coords)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_coords
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(delta_coords_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(delta_coords_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(delta_coords_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_coords)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_coords\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_coords
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(delta_coords_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(delta_coords_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(delta_coords_generate_messages_py std_msgs_generate_messages_py)
endif()
