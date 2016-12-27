#!/bin/bash

cp -r files ${ROOTFS_DIR}/files
on_chroot << EOF
dpkg -i files/*.deb
EOF
rm -rf ${ROOTFS_DIR}/files
