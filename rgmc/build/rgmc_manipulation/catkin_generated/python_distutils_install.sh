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

echo_and_run cd "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/akoh751/autonomous_assembly_robot/rgmc/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/akoh751/autonomous_assembly_robot/rgmc/install/lib/python3/dist-packages:/home/akoh751/autonomous_assembly_robot/rgmc/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/akoh751/autonomous_assembly_robot/rgmc/build" \
    "/usr/bin/python3" \
    "/home/akoh751/autonomous_assembly_robot/rgmc/src/rgmc_manipulation/setup.py" \
     \
    build --build-base "/home/akoh751/autonomous_assembly_robot/rgmc/build/rgmc_manipulation" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/akoh751/autonomous_assembly_robot/rgmc/install" --install-scripts="/home/akoh751/autonomous_assembly_robot/rgmc/install/bin"
