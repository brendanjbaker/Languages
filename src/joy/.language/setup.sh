#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	git \
	cmake \
	git

mkdir -p '/opt/joy'
pushd '/opt/joy'
git clone 'https://github.com/Wodan58/Joy.git' '1.59'
pushd '1.59'
git checkout '7fbeebcdc15147e7b24760e42869997a02be0f95'
mkdir 'build'
pushd 'build'
cmake -G "Unix Makefiles" ..
cmake --build .
cp ../lib/usrlib.joy ~
mkdir ~/usrlib
cp ../lib/* ~/usrlib
popd; popd; popd
