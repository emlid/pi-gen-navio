#!/bin/bash -ex

install -m 644 files/config.txt ${ROOTFS_DIR}/boot/

cp -r files/*.deb ${ROOTFS_DIR}/files

on_chroot sh -e - << EOF
apt-get purge raspberrypi-bootloader -y
apt-get autoremove -y
dpkg -i files/*.deb
EOF

rm -rf ${ROOTFS_DIR}/files
