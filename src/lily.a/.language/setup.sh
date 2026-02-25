#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cmake \
	gcc \
	git

mkdir '/opt/lily'
pushd '/opt/lily'
git clone 'https://gitlab.com/FascinatedBox/lily.git' '2.3'
pushd '2.3'
git checkout 'v2.3' 2> /dev/null
cmake .
cmake --build .
ln -s '/opt/lily/2.3/lily' '/usr/bin/lily'
popd; popd
