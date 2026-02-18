#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cmake \
	git

mkdir '/tmp/algol'
pushd '/tmp/algol'
git clone 'https://github.com/sergev/x1-algol-compiler.git' '.'
git checkout '938fa031a00557110b5a5834b2b43404853f2201' 2> /dev/null
make
make install
popd
