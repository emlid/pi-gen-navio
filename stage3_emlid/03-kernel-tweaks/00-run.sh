#!/bin/bash -ex

install -m 644 files/config.txt ${ROOTFS_DIR}/boot/

on_chroot sh -e - << EOF
apt-get purge raspberrypi-bootloader -y
apt-get autoremove -y
EOF
