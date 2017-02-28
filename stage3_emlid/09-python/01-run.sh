#!/bin/bash -ex

cp -f files/requirements3.txt ${ROOTFS_DIR}/home/pi
cp -f files/requirements2.txt ${ROOTFS_DIR}/home/pi

on_chroot << EOF
pip3 install -i https://testpypi.python.org/pypi navio2
pip3 install -r /home/pi/requirements3.txt
pip2 install -r /home/pi/requirements2.txt
EOF

rm ${ROOTFS_DIR}/home/pi/requirements*.txt
