#!/usr/bin/env bash

apt-get install -y --no-install-recommends \
	build-essential \
	git

mkdir -p '/tmp/bcpl'
pushd '/tmp/bcpl'
git clone --depth 1 'https://github.com/SergeGris/BCPL-compiler.git' 'bcpl-compiler'
pushd 'bcpl-compiler/src'
make
make install
pushd; pushd
rm -fr '/tmp/bcpl'
