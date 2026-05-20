#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	clang \
	git

mkdir '/opt/flower'
pushd '/opt/flower'
git clone 'https://github.com/IvyMycelia/flower.git' '9a2e425'
pushd '9a2e425'
git checkout '9a2e4251e142f31c2a9389f102a78311cd245bfa' 2> /dev/null
gcc bin/Flower.c -o bin/Flower
# make -f MAKEFILE build
popd; popd
ln -s '/opt/flower/9a2e425/bin/Flower' '/usr/bin/flower'
