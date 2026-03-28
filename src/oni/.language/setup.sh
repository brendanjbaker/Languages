#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	clang \
	git

mkdir '/opt/oni'
pushd '/opt/oni'
git clone 'https://git.sr.ht/~badd10de/oni-lang' '0.18'
pushd '0.18'
git checkout 'aefe19911f52a1332c12ec1c9df15c1d4fa595d3' 2> /dev/null
make release
make install
popd; popd
