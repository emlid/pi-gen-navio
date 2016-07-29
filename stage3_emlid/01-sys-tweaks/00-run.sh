#!/bin/bash -e

install -m 644 ${ROOTFS_DIR}/etc/wpa_supplicant/wpa_supplicant.conf ${ROOTFS_DIR}/boot
ln -sf /boot/wpa_supplicant.conf ${ROOTFS_DIR}/etc/wpa_supplicant/wpa_supplicant.conf
