#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cmake \
	git \
	libunwind-dev \
	make

mkdir '/opt/cwerg'
pushd '/opt/cwerg'
git clone 'https://github.com/robertmuth/Cwerg.git' '6cb0415'
pushd '6cb0415'
git checkout '6cb041556f509a94975f6aff121a68b4456cfd38' 2> /dev/null
make cmake_setup
pushd 'build'
make 'compiler.exe'
make 'x64_codegen_tool.exe'
popd; popd; popd
ln -s '/opt/cwerg/6cb0415/build/compiler.exe' '/usr/bin/cwc'
ln -s '/opt/cwerg/6cb0415/build/x64_codegen_tool.exe' '/usr/bin/cwcg'
