#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git

mkdir '/tmp/xs'
pushd '/tmp/xs'
git clone 'https://github.com/xs-lang0/xs.git' '0.3.9'
pushd '0.3.9'
git checkout 'facb59255ff9bc6e4e6090746228bd94454e0c5d' 2> /dev/null
make release
make install
popd; popd
