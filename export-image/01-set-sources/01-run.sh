#!/bin/bash -e

on_chroot << EOF
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade
apt-get clean
EOF
