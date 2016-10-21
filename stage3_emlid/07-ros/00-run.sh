#!/bin/bash

on_chroot sh -e << EOF
echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116
apt-get update
EOF
