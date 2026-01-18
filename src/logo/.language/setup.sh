#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	autoconf \
	automake \
	libncurses-dev \
	libtinfo-dev \
	libtool

mkdir '/tmp/logo'
pushd '/tmp/logo'

download \
	--url 'https://people.eecs.berkeley.edu/~bh/downloads/ucblogo.tar.gz' \
	--hash 'bf2cc51658e05119a73befeb81415fbee74b66ba'

tar -xzf 'ucblogo.tar.gz'
pushd ucblogo-*
./configure enable_docs=no enable_wx=no
make CFLAGS="-Wno-error=incompatible-pointer-types -Wno-deprecated-declarations"
make install
popd; popd
rm -fr '/tmp/logo'
