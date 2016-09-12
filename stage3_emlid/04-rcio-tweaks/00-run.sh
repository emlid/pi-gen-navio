#!/bin/bash -ex

ln -sf /usr/bin/dtc ${ROOTFS_DIR}/usr/local/bin/dtc

mkdir -p ${ROOTFS_DIR}/files
install -m 644 files/*.deb ${ROOTFS_DIR}/files

on_chroot bash
on_chroot dpkg -i ${ROOTFS_DIR}/files/rcio-firmware_0.1_armhf.deb ${ROOTFS_DIR}/files/rtl8812au-dkms_4.3.8.12175.20140902-0raspbian3_all.deb
