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
git clone 'https://github.com/robertmuth/Cwerg.git' '706c7fc'
pushd '706c7fc'
git checkout '706c7fc32fae31c56ccc3bb89d122f6c36d7080f' 2> /dev/null
make build_compiler
popd; popd
ln -s '/opt/cwerg/706c7fc/cwerg.py' '/usr/bin/cwc'
