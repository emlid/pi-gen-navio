#!/bin/bash -ex

ROS_RELEASE='noetic'
DEB_RELEASE='buster'

ROS_PKGS='ros_comm mavlink mavros'

CFG_NAME="${ROS_RELEASE}.rosinstall"
INSTALL_PATH="/opt/ros/${ROS_RELEASE}"
GEOSET_SCR_NAME='install_geographiclib_datasets.sh'
WORKSPACE_NAME='src'
ROS_BUILD_PATH='/tmp/ros/'
PYTHON_PATH='/usr/bin/python3'

pip install -U future

if [[ ! -d "/etc/ros" ]]; then
    c_rehash /etc/ssl/certs
    rosdep init
fi
rosdep update

if [[ ! -d "${ROS_BUILD_PATH}" ]]; then
    mkdir ${ROS_BUILD_PATH}
fi
cd ${ROS_BUILD_PATH}

rosinstall_generator ${ROS_PKGS} --rosdistro ${ROS_RELEASE} --deps --wet-only --tar | tee ${CFG_NAME}
wstool init ${WORKSPACE_NAME} ${CFG_NAME} || wstool merge -t ${WORKSPACE_NAME} ${CFG_NAME}

wstool update -t ${WORKSPACE_NAME}
rosdep install -y --from-paths ${WORKSPACE_NAME} --ignore-src --rosdistro ${ROS_RELEASE} -r --os=debian:${DEB_RELEASE}

./${WORKSPACE_NAME}/catkin/bin/catkin_make_isolated --install -DPYTHON_EXECUTABLE=${PYTHON_PATH} -DCMAKE_BUILD_TYPE=Release --install-space ${INSTALL_PATH} -DCATKIN_ENABLE_TESTING=0

source ${INSTALL_PATH}/setup.bash

cd /tmp
if [[ ! -f "${GEOSET_SCR_NAME}" ]]; then
    wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/${GEOSET_SCR_NAME}
fi
bash ./${GEOSET_SCR_NAME}

if ! `cat /etc/bash.bashrc | grep "source ${INSTALL_PATH}/setup.bash"`; then
    echo "source ${INSTALL_PATH}/setup.bash" >> /etc/bash.bashrc
fi

