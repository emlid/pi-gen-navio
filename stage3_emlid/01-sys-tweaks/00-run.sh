#!/bin/bash -e

install -m 644 files/wpa_supplicant.conf ${ROOTFS_DIR}/boot
install -m 644 files/modules ${ROOTFS_DIR}/etc/modules

ln -sf /boot/wpa_supplicant.conf ${ROOTFS_DIR}/etc/wpa_supplicant/wpa_supplicant.conf
