#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cargo \
	git \
	libclang-common-18-dev \
	libpolly-18-dev \
	libstdc++-12-dev \
	libzstd-dev \
	llvm-18 \
	llvm-18-dev \
	rustc \
	zlib1g-dev

mkdir '/tmp/inko'
pushd '/tmp/inko'
git clone 'https://github.com/inko-lang/inko.git' '0.19.1'
pushd '0.19.1'
git checkout '6fa225857369db4b65c4b8edc7afb568eade4f33' > /dev/null
make build
make install
popd; popd
rm -fr '/tmp/inko'
