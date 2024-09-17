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

echo_and_run cd "/home/mechp4p/autonomous_manipulator/rgmc/src/ndx_util"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/mechp4p/autonomous_manipulator/rgmc/install_isolated/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/mechp4p/autonomous_manipulator/rgmc/install_isolated/lib/python3/dist-packages:/home/mechp4p/autonomous_manipulator/rgmc/build_isolated/ndx_util/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/mechp4p/autonomous_manipulator/rgmc/build_isolated/ndx_util" \
    "/usr/bin/python3" \
    "/home/mechp4p/autonomous_manipulator/rgmc/src/ndx_util/setup.py" \
     \
    build --build-base "/home/mechp4p/autonomous_manipulator/rgmc/build_isolated/ndx_util" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/mechp4p/autonomous_manipulator/rgmc/install_isolated" --install-scripts="/home/mechp4p/autonomous_manipulator/rgmc/install_isolated/bin"
