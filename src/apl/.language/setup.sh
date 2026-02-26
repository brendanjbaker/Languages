#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	libncurses-dev \
	wget

mkdir -p '/opt/apl'
pushd '/opt/apl'
wget -q 'https://ftp.gnu.org/gnu/apl/apl-1.9.tar.gz'
printf '%s  %s\n' '594f18c8fd197dc8088ecf94b613247e7763890e' 'apl-1.9.tar.gz' | sha1sum --check -
tar -xzf 'apl-1.9.tar.gz'
mv 'apl-1.9' '1.9'
pushd '1.9'
./configure
make -j"$(nproc)"
make install
popd; popd
