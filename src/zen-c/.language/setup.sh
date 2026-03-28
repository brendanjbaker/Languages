#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git

mkdir '/opt/zen-c'
pushd '/opt/zen-c'
git clone 'https://github.com/zenc-lang/zenc.git' '0.4.4'
pushd '0.4.4'
git checkout '5ec697eecc95aeb702902e8838bcd6711ecafeaf' 2> /dev/null
make
make install
popd; popd
