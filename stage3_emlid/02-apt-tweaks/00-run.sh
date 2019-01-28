#!/bin/bash -e

install -m 644 files/emlid.list ${ROOTFS_DIR}/etc/apt/sources.list.d/
install -m 644 files/emlid ${ROOTFS_DIR}/etc/apt/preferences.d/
install -m 644 files/kernel ${ROOTFS_DIR}/etc/apt/preferences.d/

on_chroot apt-key add - < files/emlid.gpg.key
on_chroot apt-key add - < files/emlid-builder.gpg.key
on_chroot << EOF
apt-get update
apt-get dist-upgrade -y --allow-downgrades
EOF
