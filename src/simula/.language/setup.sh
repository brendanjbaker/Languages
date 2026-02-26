#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	autoconf \
	automake \
	build-essential \
	gcc \
	libtool \
	wget

mkdir -p /usr/local/cim
pushd /usr/local/cim
wget -q 'https://ftp.gnu.org/gnu/cim/cim-5.1.tar.gz'
printf '%s  %s\n' '270a63098f417c91d9e65e5745bb31c1e947e668' 'cim-5.1.tar.gz' | sha1sum --check -
tar -xf 'cim-5.1.tar.gz'
mv "cim-5.1" "5.1"
pushd "5.1"

function apply_patch {
	# Patch needed to build: fixes "cannot find cim.h" error.
	ln -s /usr/local/cim/5.1/lib /usr/local/cim/lib
}

apply_patch
./configure
make -j"$(nproc)" CFLAGS="-g -O2 -std=gnu89 -Wno-implicit-function-declaration -Wno-implicit-int"
make install
ldconfig
ln -s /usr/local/cim/5.1/src/cim /usr/bin/cim
popd
popd
