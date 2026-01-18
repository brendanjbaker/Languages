#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	bison \
	build-essential \
	flex \
	git \
	libffi-dev \
	make

pushd /tmp
git clone --depth 1 'https://github.com/never-lang/never.git' never
pushd never
mkdir build
pushd build
cmake ..
make
mv never /usr/bin
popd; popd; popd
