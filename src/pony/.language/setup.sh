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
# CloudSmith. Therefore, we will build from source.

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cmake \
	git \
	lld \
	python3

mkdir '/opt/ponyc'
pushd '/opt/ponyc'
git clone 'https://github.com/ponylang/ponyc.git' '0.62.1'
pushd '0.62.1'
git checkout '49f73be6ed5c61735e65874a5991866828312114' 2> /dev/null
make libs
make configure
make build
make install
popd; popd
