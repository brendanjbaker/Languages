#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	flex \
	gcc \
	git \
	libgc-dev \
	libsdl1.2-dev \
	make \
	yacc

pushd /usr/local
git clone --depth 1 'https://github.com/rsdoiel/obnc.git' obnc
pushd obnc
./build
./install
popd; popd
