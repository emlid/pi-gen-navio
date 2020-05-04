#!/bin/bash -ex

SKIP_BUILD=0 # Set to 1 to skip ROS build. For development purpose only!

# fix CA-Cert
c_rehash /etc/ssl/certs

# Initialize rosdep and update repository
if [[ ! -d "/etc/ros" ]]; then # Test if rosdep already initialized (rebuild without CLEAN=1)
    rosdep init
fi
rosdep update

# Create a catkin workspace
if [[ ! -d "~/ros_catkin_ws" ]]; then # Test if catkin build root already initialized (rebuild without CLEAN=1)
    mkdir -p ~/ros_catkin_ws
fi
cd ~/ros_catkin_ws

# Generate the build config
rosinstall_generator ros_base mavros --rosdistro melodic --deps --wet-only --tar > melodic-ros-wet.rosinstall

ls ~/ros_catkin_ws

# Initialize the workspace
if [[ ! -f "~/ros_catkin_ws/src/.rosinstall" ]]; then
    echo "1"
    wstool init src melodic-ros-wet.rosinstall
else # Update the workspace if already initialized
    echo "2"
    wstool merge -t src melodic-ros-wet.rosinstall
    wstool update -t src
fi
# Resolving dependencies 
echo "3"
rosdep install -y --from-paths src --ignore-src --rosdistro melodic -r --os=debian:buster

# Building the catkin workspace
if [[ SKIP_BUILD -eq 0 ]]; then # See the 3rd line of this script
echo "4"
    ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/melodic
fi
# Adding ROS to the bash.rc
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc