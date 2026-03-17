#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ansifilter \
	ca-certificates \
	git \
	golang-go \
	wget

mkdir '/opt/rye'
pushd '/opt/rye'
git clone 'https://github.com/refaktor/rye.git' '0.2.2'
pushd '0.2.2'
git checkout '61cf1e242e9fff6e3a52dda51aab79bce83cf669' 2> /dev/null
./build
popd; popd
ln -s '/opt/rye/0.2.2/bin/rye' '/usr/bin/rye'
