#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	clang \
	cmake \
	git \
	libclang-dev \
	libcurl4-openssl-dev \
	libedit-dev \
	libzstd-dev \
	llvm-dev \
	ninja-build \
	python3 \
	zlib1g-dev

pushd '/usr/local'
git clone --depth 1 'https://github.com/beefytech/Beef.git' beef
pushd 'beef'
./bin/build.sh
ln -s '/usr/local/beef/IDE/dist/BeefBuild' '/usr/bin/BeefBuild'
popd; popd
