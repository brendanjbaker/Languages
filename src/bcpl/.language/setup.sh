#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git

mkdir -p '/tmp/bcpl'
pushd '/tmp/bcpl'
git clone --depth 1 'https://github.com/SergeGris/BCPL-compiler.git' 'bcpl-compiler'
pushd 'bcpl-compiler/src'
make -j"$(nproc)"
make install
pushd; pushd
rm -fr '/tmp/bcpl'
