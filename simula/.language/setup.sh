#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y \
	autoconf \
	automake \
	build-essential \
	gcc \
	libtool \
	wget

declare filename='cim-5.1.tar.gz'
declare url="https://ftp.gnu.org/gnu/cim/$filename"

mkdir -p /usr/local/cim
pushd /usr/local/cim

wget \
	--output-document "$filename" \
	--quiet \
	"$url"

tar -xf "$filename"
mv "cim-5.1" "5.1"
pushd "5.1"

function apply_patch {
	# Patch needed to build: fixes "cannot find cim.h" error.
	ln -s /usr/local/cim/5.1/lib /usr/local/cim/lib
}

apply_patch
./configure
make CFLAGS="-g -O2 -std=gnu89 -Wno-implicit-function-declaration -Wno-implicit-int"
make install
ldconfig
ln -s /usr/local/cim/5.1/src/cim /usr/bin/cim
popd
popd
