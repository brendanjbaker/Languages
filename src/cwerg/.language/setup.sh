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
git clone 'https://github.com/robertmuth/Cwerg.git' '5d2a521'
pushd '5d2a521'
git checkout '5d2a521c31341e8578c1af04641e388642a41cbb' 2> /dev/null
make cmake_setup
pushd 'build'
make 'compiler.exe'
make 'x64_codegen_tool.exe'
popd; popd; popd
ln -s '/opt/cwerg/5d2a521/build/compiler.exe' '/usr/bin/cwc'
ln -s '/opt/cwerg/5d2a521/build/x64_codegen_tool.exe' '/usr/bin/cwcg'
