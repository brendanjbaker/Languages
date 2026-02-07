#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	clang \
	cmake \
	g++-aarch64-linux-gnu \
	g++-arm-linux-gnueabihf \
	gcc-aarch64-linux-gnu \
	gcc-arm-linux-gnueabihf \
	git \
	libc6-dev-arm64-cross \
	libc6-dev-armhf-cross \
	libunwind-dev \
	linux-libc-dev-arm64-cross \
	linux-libc-dev-armhf-cross \
	python3 \
	qemu-user-static

export PYTHONPATH='/opt/cwerg/f834ff3'

mkdir '/opt/cwerg'
pushd '/opt/cwerg'
git clone 'https://github.com/robertmuth/Cwerg.git' 'f834ff3'
pushd 'f834ff3'
git checkout 'f834ff333456bc98ef53f40f3836e1bd2dfe56d8' 2> /dev/null
PYPY=python3 CC=gcc CXX=g++ MAKESILENT= make > /dev/null 2>&1 || true
ln -s '/opt/cwerg/f834ff3/FE/compiler.py' '/usr/bin/cwerg-c'
ln -s '/opt/cwerg/f834ff3/BE/CodeGenX64/codegen.py' '/usr/bin/cwerg-gen'
