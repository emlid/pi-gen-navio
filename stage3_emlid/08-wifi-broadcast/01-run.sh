#!/bin/bash

on_chroot sh - << EOF
dpkg -i files/*.deb
EOF
