#!/usr/bin/env bash

apt-get install -y --no-install-recommends \
	llvm \
	wget

pushd '/tmp'
wget --quiet 'https://github.com/sergev/blang/releases/download/v0.1/blang_0.1-1_amd64.deb'
dpkg -i 'blang_0.1-1_amd64.deb'
rm 'blang_0.1-1_amd64.deb'
popd
