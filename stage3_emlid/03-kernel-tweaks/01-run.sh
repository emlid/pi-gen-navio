#!/bin/bash -ex

install -m 644 files/config.txt ${ROOTFS_DIR}/boot/

mkdir -p ${ROOTFS_DIR}/files
cp -r files/*.deb ${ROOTFS_DIR}/files

on_chroot << EOF
apt-get purge raspberrypi-bootloader raspberrypi-kernel -y
apt-get autoremove -y
PACKAGE_NAME=$(debconf-get-selections | grep 'linux-image-' | cut -f1 | head -1)
PACKAGE_VERSION=$(echo $PACKAGE | cut -d- -f3-)
echo "$PACKAGE_NAME $PACKAGE_NAME/preinst/overwriting-modules-$PACKAGE_VERSION boolean false" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive dpkg -i files/*.deb
EOF

rm -rf ${ROOTFS_DIR}/files
