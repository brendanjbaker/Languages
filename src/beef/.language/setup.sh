#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
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

# The last release tag, '0.43.5', doesn't work with the below. Instead, use the
# latest commit as of 19-Feb-2026, which is 25cdb05.

pushd '/usr/local'
git clone 'https://github.com/beefytech/Beef.git' 'beef'
pushd 'beef'
git checkout '25cdb052655692f977b5aa696bb4bffb3dd8ad4c' 2> /dev/null
./bin/build.sh
ln -s '/usr/local/beef/IDE/dist/BeefBuild' '/usr/bin/BeefBuild'
popd; popd
