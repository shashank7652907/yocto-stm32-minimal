#!/bin/bash

# Install required packages
sudo apt update
sudo apt install -y gawk wget git diffstat unzip texinfo gcc-multilib \
build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
xz-utils debianutils iputils-ping libsdl1.2-dev xterm curl locales lz4

# Install repo tool
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
export PATH=~/bin:$PATH

# Yocto repo init + sync
mkdir -p ~/yocto-stm32 && cd ~/yocto-stm32
repo init -u https://github.com/STMicroelectronics/oe-manifest.git -b kirkstone
repo sync

# Source environment
DISTRO=openstlinux-weston MACHINE=stm32mp1-disco source layers/meta-st/scripts/envsetup.sh

