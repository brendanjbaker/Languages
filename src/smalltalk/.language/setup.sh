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

wget --quiet https://ftp.gnu.org/gnu/smalltalk/smalltalk-3.2.5.tar.gz
tar xvf smalltalk-3.2.5.tar.gz
cd "smalltalk-3.2.5"
./configure

# On Debian 13 (but not 12), we need "-Wno-error=incompatible-pointer-types".
make CFLAGS="-g -O2 -Wno-error=incompatible-pointer-types"

# Running "make install" exits with status 2, but it seems to work anyway.
make install || true
