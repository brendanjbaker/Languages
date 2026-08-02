#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cmake \
	git \
	libunwind-dev \
	make \
	python3

mkdir '/opt/cwerg'
pushd '/opt/cwerg'
git clone 'https://github.com/robertmuth/Cwerg.git' '3bc94f7'
pushd '3bc94f7'
git checkout '3bc94f7c1c26834f98c614aef51b5aa7370615d9' 2> /dev/null
make build_compiler
popd; popd
ln -s '/opt/cwerg/3bc94f7/cwerg.py' '/usr/bin/cwc'
