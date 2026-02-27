#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	autoconf \
	automake \
	build-essential \
	ca-certificates \
	gcc \
	libtool \
	wget

# Patch needed to build: fixes "cannot find cim.h" error.
function apply_patch {
	ln -s /opt/cim/5.1/lib /opt/cim/lib
}

mkdir '/opt/cim'
pushd '/opt/cim'
wget -q 'https://ftp.gnu.org/gnu/cim/cim-5.1.tar.gz'
printf '%s  %s\n' '270a63098f417c91d9e65e5745bb31c1e947e668' 'cim-5.1.tar.gz' | sha1sum --check -
tar -xf 'cim-5.1.tar.gz'
mv "cim-5.1" "5.1"
pushd "5.1"
apply_patch
./configure
make -j"$(nproc)" CFLAGS="-g -O2 -std=gnu89 -Wno-implicit-function-declaration -Wno-implicit-int"
make install
popd; popd
ldconfig
ln -s '/opt/cim/5.1/src/cim' '/usr/bin/cim'
