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
	libunwind-dev \
	python3 \
	qemu-user-static

export PYTHONPATH='/opt/cwerg/f834ff3'

mkdir '/opt/cwerg'
pushd '/opt/cwerg'
git clone 'https://github.com/robertmuth/Cwerg.git' 'f834ff3'
pushd 'f834ff3'
git checkout 'f834ff333456bc98ef53f40f3836e1bd2dfe56d8' 2> /dev/null
PYPY=python3 CC=gcc CXX=g++ MAKESILENT= make || true
