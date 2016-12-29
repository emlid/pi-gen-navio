#!/bin/bash

cp -r files ${ROOTFS_DIR}
on_chroot << EOF
dpkg -i files/*.deb
EOF
rm -rf ${ROOTFS_DIR}/files
