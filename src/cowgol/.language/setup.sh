#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	64tass \
	binutils-arm-linux-gnueabihf \
	binutils-i686-linux-gnu \
	binutils-m68k-linux-gnu \
	binutils-powerpc-linux-gnu \
	bison \
	flex \
	git \
	gpp \
	libbsd-dev \
	libreadline-dev \
	libz80ex-dev \
	lua5.1 \
	make \
	moreutils \
	nasm \
	python3 \
	qemu-user

mkdir -p '/opt/cowgol'
pushd '/opt/cowgol'
git clone 'https://github.com/davidgiven/cowgol.git' '0.6.1'
pushd '0.6.1'
git checkout 'b38e251c12333bb8099c6563794d67c9fee1bbed' 2> /dev/null
make --jobs=$(nproc)

ln -fs '/opt/cowgol/0.6.1/bin/cowfe-for-80386-with-nncgen' '/usr/bin/cowfe-for-80386-with-nncgen'
ln -fs '/opt/cowgol/0.6.1/bin/cowbe-for-80386-with-nncgen' '/usr/bin/cowbe-for-80386-with-nncgen'
ln -fs '/opt/cowgol/0.6.1/bin/cowlink-for-lx386-with-nncgen' '/usr/bin/cowlink-for-lx386-with-nncgen'
