#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	clang \
	cmake \
	git \
	pip \
	python3 \
	sudo

apt-cache policy qemu-user-static

apt-cache madison libc6-dev-i386
apt-cache madison libc6-x32

apt-get install -y qemu-user-static
apt-get install -y libunwind-dev gcc-multilib
apt-get install -y gcc-arm-linux-gnueabihf  g++-arm-linux-gnueabihf
apt-get install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu

mkdir '/opt/cwerg'
pushd '/opt/cwerg'
git clone 'https://github.com/robertmuth/Cwerg.git' 'current'
popd
