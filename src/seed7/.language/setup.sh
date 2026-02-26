#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	libncurses-dev \
	libx11-dev \
	wget

mkdir -p '/opt/seed7'
pushd '/opt/seed7'
wget -q 'https://master.dl.sourceforge.net/project/seed7/seed7/seed7_05_20250930/seed7_05_20250930.tgz'
printf '%s  %s\n' '564034d84c171b71cb2b4f6916614a2da0b5dc91' 'seed7_05_20250930.tgz' | sha1sum --check -
tar -xf 'seed7_05_20250930.tgz'
mv 'seed7' '2025-09-30'
pushd '2025-09-30/src'
make depend
make -j"$(nproc)"
make s7c
make install
popd; popd
