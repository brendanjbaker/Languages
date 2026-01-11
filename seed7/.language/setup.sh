#!/usr/bin/env bash

apt-get install -y --no-install-recommends \
	build-essential \
	libncurses-dev \
	libx11-dev

mkdir -p '/opt/seed7'
pushd '/opt/seed7'
# sha1sum = 564034d84c171b71cb2b4f6916614a2da0b5dc91
wget --quiet 'https://master.dl.sourceforge.net/project/seed7/seed7/seed7_05_20250930/seed7_05_20250930.tgz'
tar -xf 'seed7_05_20250930.tgz'
mv 'seed7' '2025-09-30'
pushd '2025-09-30/src'
make depend
make
make s7c
make install
popd; popd
