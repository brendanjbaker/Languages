#!/usr/bin/env bash

set -Eeuo pipefail

apt-get install -y \
	build-essential \
	gawk \
	gcc \
	libgmpxx4ldbl \
	libncurses-dev \
	libncurses6 \
	unzip \
	wget

# Running "make install" exits with status 2, but it seems to work anyway.

declare zip_path

zip_path=$(which unzip)

wget --quiet https://ftp.gnu.org/gnu/smalltalk/smalltalk-3.2.5.tar.gz
tar xvf smalltalk-3.2.5.tar.gz
cd "smalltalk-3.2.5"
export ZIP="$zip_path"
./configure
make
make install || true
