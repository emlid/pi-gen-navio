#!/bin/bash -ex

mkdir -p ${ROOTFS_DIR}/files
install -m 644 files/*.deb ${ROOTFS_DIR}/files
on_chroot dpkg -i files/rcio-firmware_0.1_armhf.deb
rm -rf ${ROOTFS_DIR}/files
