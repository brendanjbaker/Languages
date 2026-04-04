#!/usr/bin/env bash

# The recommended way to install Pony is via PonyUp:
#
# https://github.com/ponylang/ponyup
#
# Version 0.15.1 of the "ponyup-init.sh" file is here:
#
# https://raw.githubusercontent.com/ponylang/ponyup/d16d27eb6cab9c458a4a4272dcbcd8cac8424d98/ponyup-init.sh
#
# However, it usually fails to successfully download the necessary file(s) from
# CloudSmith. Therefore, we will build from source. This includes an LLVM
# repository clone and build, so it takes forever.

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cmake \
	git \
	lld \
	python3 \
	zlib1g-dev

mkdir '/tmp/pony'
pushd '/tmp/pony'
git clone 'https://github.com/ponylang/ponyc.git' '0.63'
pushd '0.63'
git checkout 'dc7f4f29b944a3e8f0d408586be6e0cb5e68a57a' 2> /dev/null
git submodule update --init --recursive --depth 1
make -j1 libs
make configure
make build
make install
popd; popd
rm -fr '/tmp/pony'
