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
git clone 'https://github.com/robertmuth/Cwerg.git' '0dbee53'
pushd '0dbee53'
git checkout '0dbee53c6adc8da0c5f0065ee14a697e849372d7' 2> /dev/null
make build_compiler
popd; popd
ln -s '/opt/cwerg/0dbee53/cwerg.py' '/usr/bin/cwc'
