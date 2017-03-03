#!/bin/bash

#A hack around bug in Indigo libmavconn
cp files/libmavconn.so ${ROOTFS_DIR}/opt/ros/indigo/lib/libmavconn.so.18.3
on_chroot << EOF
cp /opt/ros/indigo/lib/libmavconn.so /opt/ros/indigo/lib/libmavconn.so.17.4 
ln -sf /opt/ros/indigo/lib/libmavconn.so.18.3 /opt/ros/indigo/lib/libmavconn.so 
ln -sf /usr/lib/arm-linux-gnueabihf/liblog4cxx.so /usr/lib/liblog4cxx.so
apt-mark hold ros-indigo-mavros
EOF

