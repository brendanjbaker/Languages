#!/usr/bin/env bash

set -Eeuo pipefail

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	gawk \
	gcc \
	unzip \
	wget

export ZIP="$(which unzip)"

mkdir -p '/tmp/smalltalk'
pushd '/tmp/smalltalk'

download \
	--url 'https://ftp.gnu.org/gnu/smalltalk/smalltalk-3.2.5.tar.gz' \
	--hash '4dd77b769131527add276ded01666e089da3b8b1'

tar -xvf 'smalltalk-3.2.5.tar.gz'
pushd 'smalltalk-3.2.5'
./configure

# On Debian 13 (but not 12), we need "-Wno-error=incompatible-pointer-types".
make -j"$(nproc)" CFLAGS="-g -O2 -Wno-error=incompatible-pointer-types"

# Running "make install" exits with status 2, but it seems to work anyway.
make install || true

popd; popd
rm -fr '/tmp/smalltalk'
