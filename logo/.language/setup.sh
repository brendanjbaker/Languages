#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	autoconf \
	automake \
	libncurses-dev \
	libtinfo-dev \
	libtool

pushd /tmp
wget --quiet 'https://people.eecs.berkeley.edu/~bh/downloads/ucblogo.tar.gz'
tar -xzf 'ucblogo.tar.gz'
pushd ucblogo-*
./configure enable_docs=no enable_wx=no
make CFLAGS="-Wno-error=incompatible-pointer-types -Wno-deprecated-declarations"
make install
popd; popd
