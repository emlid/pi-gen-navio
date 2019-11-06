#!/bin/bash -ex

on_chroot << EOF
readlink -e /home/* | grep -v pi | xargs rm -rf

EOF
