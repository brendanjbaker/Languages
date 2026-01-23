#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cmake \
	git

mkdir -p '/opt/joy'
pushd '/opt/joy'
git clone 'https://github.com/Wodan58/Joy.git' '1.59'
pushd '1.59'
git checkout '7fbeebcdc15147e7b24760e42869997a02be0f95' 2> /dev/null
mkdir 'build'
pushd 'build'
cmake -G "Unix Makefiles" ..
cmake --build .
popd; popd; popd

ln -s /opt/joy/1.59/build/joy /usr/bin/joy

ln -s /opt/joy/1.59/lib/usrlib.joy ~/usrlib.joy
ln -s /opt/joy/1.59/lib/agglib.joy /lib/agglib.joy
ln -s /opt/joy/1.59/lib/inilib.joy /lib/inilib.joy
