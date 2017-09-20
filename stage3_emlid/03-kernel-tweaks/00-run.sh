#!/bin/bash -ex

install -m 644 files/config.txt ${ROOTFS_DIR}/boot/

on_chroot << EOF
apt-get purge libraspberrypi-dev raspberrypi-bootloader raspberrypi-kernel -y
apt-get autoremove -y
PACKAGE_NAME=$(debconf-get-selections | grep 'linux-image-' | cut -f1 | head -1)
PACKAGE_VERSION=$(echo $PACKAGE | cut -d- -f3-)
echo "$PACKAGE_NAME $PACKAGE_NAME/preinst/overwriting-modules-$PACKAGE_VERSION boolean false" | debconf-set-selections
EOF
