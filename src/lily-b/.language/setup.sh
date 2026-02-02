#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	automake \
	build-essential \
	ca-certificates \
	clang \
	clang-format \
	clang-tools \
	cmake \
	git \
	libclang-dev \
	libcurl4-openssl-dev \
	libedit-dev \
	liblld-18-dev \
	libstdc++-14-dev \
	libtool \
	libzstd-dev \
	lld-18 \
	llvm-18-dev \
	ninja-build \
	python3 \
	zlib1g-dev

export CC='clang'
export CXX='clang++'

mkdir '/opt/lily'
pushd '/opt/lily'
git clone 'https://github.com/thelilylang/lily.git' '0.12.0'
pushd '0.12.0'
git submodule update --init 'lib/local/src/libyaml'
pushd 'lib/local/src/libyaml'
./bootstrap
./configure
popd
ln -s '/opt/lily/0.12.0/lib/local/src/libyaml/include/config.h' '/opt/lily/0.12.0/lib/local/src/libyaml/src/config.h'
make configure
ninja -C build -j "$(nproc)"
popd; popd
ln -s '/opt/lily/0.12.0/bin/lily' '/usr/bin/lily'
ln -s '/opt/lily/0.12.0/bin/lilyc' '/usr/bin/lilyc'
