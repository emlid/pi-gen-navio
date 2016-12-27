#!/bin/bash

#a hack for waf to use. update-alternatives might be better
on_chroot ln -fs pkg-config /usr/bin/arm-linux-gnueabihf-pkg-config

cp -r files ${ROOTFS_DIR}
on_chroot << EOF
    dpkg -i files/*.deb
EOF
rm -rf ${ROOTFS_DIR}/files

on_chroot << EOF
    pip install mavproxy
EOF
