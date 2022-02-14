#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/louis/GDP31/workspace/src/actionlib/actionlib_tools"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/louis/GDP31/workspace/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/louis/GDP31/workspace/install/lib/python2.7/dist-packages:/home/louis/GDP31/workspace/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/louis/GDP31/workspace/build" \
    "/usr/bin/python2" \
    "/home/louis/GDP31/workspace/src/actionlib/actionlib_tools/setup.py" \
    egg_info --egg-base /home/louis/GDP31/workspace/build/actionlib/actionlib_tools \
    build --build-base "/home/louis/GDP31/workspace/build/actionlib/actionlib_tools" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/louis/GDP31/workspace/install" --install-scripts="/home/louis/GDP31/workspace/install/bin"
