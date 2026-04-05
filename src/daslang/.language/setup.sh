#!/usr/bin/env bash

shopt -s extglob

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	bison \
	build-essential \
	ca-certificates \
	cmake \
	flex \
	git \
	libgl1-mesa-dev \
	libglu1-mesa-dev \
	liburiparser-dev \
	libxcursor-dev \
	libxi-dev \
	libxinerama-dev \
	libxrandr-dev

mkdir -p '/opt/daslang'
pushd '/opt/daslang'
git clone 'https://github.com/GaijinEntertainment/daScript' '0.6.1'
pushd '0.6.1'
git checkout '7fe6f4c7b7b7a2c43790e799e9412a11d568cfce' 2> /dev/null
git submodule update --init --recursive
mkdir -p build
pushd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --target daslang --config Release --parallel "$(nproc)"
ln -s /opt/daslang/0.6.1/bin/daslang /usr/bin/daslang
popd
rm -rf !(bin|dasgen|daslib|dastest|include|lib)
popd; popd
