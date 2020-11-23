#!/bin/bash -ex

cp -f files/requirements3.txt ${ROOTFS_DIR}/home/${FIRST_USER_NAME}
cp -f files/requirements2.txt ${ROOTFS_DIR}/home/${FIRST_USER_NAME}

on_chroot << EOF
pip3 install -r /home/${FIRST_USER_NAME}/requirements3.txt
pip2 install -r /home/${FIRST_USER_NAME}/requirements2.txt
EOF

rm -rf ${ROOTFS_DIR}/home/${FIRST_USER_NAME}/requirements*.txt
rm -rf ${ROOTFS_DIR}/home/${FIRST_USER_NAME}/emlid*
