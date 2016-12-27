#!/bin/bash -e

install -m 644 files/wpa_supplicant.conf ${ROOTFS_DIR}/boot
install -m 644 files/modules ${ROOTFS_DIR}/etc/modules
install -m 644 files/cmdline.txt ${ROOTFS_DIR}/boot
install -m 644 files/motd ${ROOTFS_DIR}/etc
install -m 644 files/environment ${ROOTFS_DIR}/etc
install -m 644 /dev/null ${ROOTFS_DIR}/boot/ssh

ln -sf /boot/wpa_supplicant.conf ${ROOTFS_DIR}/etc/wpa_supplicant/wpa_supplicant.conf

on_chroot << EOF
systemctl disable hciuart
EOF
