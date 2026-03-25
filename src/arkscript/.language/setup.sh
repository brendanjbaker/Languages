#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cmake \
	gcc \
	git

mkdir '/opt/arkscript'
pushd '/opt/arkscript'
git clone 'https://github.com/ArkScript-lang/Ark.git' '4.3.3'
pushd '4.3.3'
git checkout '946d9b0edaa3abe42ab59f802fbfbba149ab0467' 2> /dev/null
git submodule update --init --recursive
cmake . -Bbuild -DCMAKE_BUILD_TYPE=Release -DARK_BUILD_EXE=On
cmake --build build --config Release
cmake --install build --config Release
popd; popd
