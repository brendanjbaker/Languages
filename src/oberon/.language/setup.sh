#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	flex \
	gcc \
	git \
	libgc-dev \
	libsdl1.2-dev \
	make \
	yacc

mkdir '/opt/oberon'
pushd '/opt/oberon'
git clone --depth 1 'https://github.com/rsdoiel/obnc.git' 'dcc15df'
pushd 'dcc15df'
git checkout 'dcc15df218ef68ae1723a308b2af915bc1764c44' 2> /dev/null
./build
./install
popd; popd
