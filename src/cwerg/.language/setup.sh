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
git clone 'https://github.com/robertmuth/Cwerg.git' '36f7947'
pushd '36f7947'
git checkout '36f79479320ba8f4d9201faa0b20a23691cd73a7' 2> /dev/null
make build_compiler
popd; popd
ln -s '/opt/cwerg/36f7947/cwerg.py' '/usr/bin/cwc'
