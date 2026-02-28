#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git

mkdir '/opt/nelua'
pushd '/opt/nelua'
git clone 'https://github.com/edubart/nelua-lang.git' 'a584505'
pushd 'a584505'
git checkout 'a58450563e2d2ec49bff499865c8b5cfdf6ff81a' 2> /dev/null
make
make install
popd; popd
