#!/bin/bash -ex

cp -f files/requirements3.txt ${ROOTFS_DIR}/home/pi
cp -f files/requirements2.txt ${ROOTFS_DIR}/home/pi

curl -H "Authorization: token $AUTH_TOKEN" -L https://api.github.com/repos/emlid/emlid-autopilot-utils/tarball/v0.1 > files/emlid.tar.gz
tar -xvf files/emlid.tar.gz -C ${ROOTFS_DIR}/home/pi/

on_chroot << EOF
pip3 install -i https://testpypi.python.org/pypi navio2
pip3 install -r /home/pi/requirements3.txt
pip2 install -r /home/pi/requirements2.txt
pushd /home/pi/emlid*
pip3 install .
popd
EOF

rm -rf ${ROOTFS_DIR}/home/pi/requirements*.txt
rm -rf ${ROOTFS_DIR}/home/pi/emlid*
