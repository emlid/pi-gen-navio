#!/bin/bash -ex

mkdir -p ${ROOTFS_DIR}/files
install -m 644 files/*.deb ${ROOTFS_DIR}/files
on_chroot << EOF
dpkg -i files/*.deb
EOF
rm -rf ${ROOTFS_DIR}/files
