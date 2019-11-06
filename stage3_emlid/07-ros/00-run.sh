#!/bin/bash

on_chroot apt-key add - < files/ros.key

on_chroot << EOF
echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list
apt-get update
EOF
