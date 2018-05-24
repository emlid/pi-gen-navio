#!/bin/bash -e

install -m 644 files/wpa_supplicant.conf ${ROOTFS_DIR}/boot
install -m 644 files/modules ${ROOTFS_DIR}/etc/modules
install -m 644 files/cmdline.txt ${ROOTFS_DIR}/boot
install -m 644 files/environment ${ROOTFS_DIR}/etc
install -m 644 /dev/null ${ROOTFS_DIR}/boot/ssh
install -m 644 files/interfaces ${ROOTFS_DIR}/etc/network

ln -sf /boot/wpa_supplicant.conf ${ROOTFS_DIR}/etc/wpa_supplicant/wpa_supplicant.conf

on_chroot << EOF
rm /etc/motd
systemctl disable hciuart
dpkg-divert --add --local /etc/wpa_supplicant/wpa_supplicant.conf
EOF
