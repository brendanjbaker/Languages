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
git clone 'https://github.com/GaijinEntertainment/daScript' '0.5.9.2.1'
pushd '0.5.9.2.1'
git checkout 'v0.5.9.2.1' 2> /dev/null
git submodule update --init
git config -f modules/dasQuirrel/.gitmodules submodule.quirrel.url 'https://github.com/GaijinEntertainment/quirrel.git'
git submodule update --init --recursive
mkdir -p build
pushd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --target daslang --config Release --parallel "$(nproc)"
ln -s /opt/daslang/0.5.9.2.1/bin/daslang /usr/bin/daslang
popd
rm -rf !(bin|dasgen|daslib|dastest|include|lib)
popd; popd
