#!/bin/bash

#a hack for waf to use. update-alternatives might be better
on_chroot << EOF 
ln -fs pkg-config /usr/bin/arm-linux-gnueabihf-pkg-config
EOF
