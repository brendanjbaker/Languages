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
git clone --depth 1 --branch 'v2.3' 'https://gitlab.com/FascinatedBox/lily.git' '2.3'
pushd '2.3'
cmake .
cmake --build .
ln -s '/opt/lily/2.3/lily' '/usr/bin/lily'
popd; popd
