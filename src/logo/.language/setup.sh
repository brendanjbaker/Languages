#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	autoconf \
	automake \
	build-essential \
	ca-certificates \
	libncurses-dev \
	libtinfo-dev \
	libtool \
	wget

mkdir '/tmp/logo'
pushd '/tmp/logo'
wget -q 'https://people.eecs.berkeley.edu/~bh/downloads/ucblogo.tar.gz'
printf '%s  %s\n' 'bf2cc51658e05119a73befeb81415fbee74b66ba' 'ucblogo.tar.gz' | sha1sum --check -
tar -xzf 'ucblogo.tar.gz'
pushd ucblogo-*
./configure enable_docs=no enable_wx=no
make -j"$(nproc)" CFLAGS="-Wno-error=incompatible-pointer-types -Wno-deprecated-declarations"
make install
popd; popd
rm -fr '/tmp/logo'
