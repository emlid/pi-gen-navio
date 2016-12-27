#!/bin/bash

mkdir -p {ROOTFS_DIR}/files
cp -r files/*.deb {ROOTFS_DIR}/files
on_chroot << EOF
dpkg -i files/*.deb
EOF
rm -rf ${ROOTFS_DIR}/files
