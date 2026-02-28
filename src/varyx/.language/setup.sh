#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git \
	libssl-dev \
	pkg-config

mkdir '/opt/varyx'
pushd '/opt/varyx'
git clone 'https://github.com/jjuran/metamage_1.git' 'e0dc2a9'
pushd 'e0dc2a9'
git checkout 'e0dc2a9dedf38e9865d54c140cce2a1a9a44a989' 2> /dev/null
./configure
./build.pl 'vx'
popd; popd
ln -s '/opt/varyx/e0dc2a9/var/build/dbg/bin/vx/vx' '/usr/bin/vx'
