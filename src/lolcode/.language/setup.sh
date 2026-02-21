#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cmake \
	git

mkdir '/tmp/lolcode'
pushd '/tmp/lolcode'
git clone 'https://github.com/justinmeza/lci.git' 'd40f88a'
pushd 'd40f88a'
git checkout 'd40f88a4471f3d4302b2f92d7505144a668d4dd1' 2> /dev/null
cmake .
make
make install
popd; popd
rm -fr '/tmp/lolcode'
ln -s '/usr/local/bin/lci' '/usr/bin/lol'
