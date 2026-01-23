#!/usr/bin/env bash

apt-get install -y --no-install-recommends \
	clang \
	llvm \
	wget

mkdir '/tmp/b'
pushd '/tmp/b'

download \
	--url 'https://github.com/sergev/blang/releases/download/v0.1/blang_0.1-1_amd64.deb' \
	--hash '9e556080feed5fd53e3620e0fe7905411716c744'

dpkg -i 'blang_0.1-1_amd64.deb'
popd
rm -fr '/tmp/b'
