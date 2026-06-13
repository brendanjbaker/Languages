#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	clang \
	git

mkdir '/tmp/flower'
pushd '/tmp/flower'
git clone 'https://github.com/IvyMycelia/flower.git' '9a2e425'
pushd '9a2e425'
git checkout '9a2e4251e142f31c2a9389f102a78311cd245bfa' 2> /dev/null
gcc 'bin/Flower.c' -o 'bin/Flower_c'
./bin/Flower_c 'src/main.flo' 'bin/Flower_f'
mkdir -p '/opt/flower/9a2e425'
mv 'bin/Flower_f' '/opt/flower/9a2e425/Flower_f'
popd; popd
rm -fr '/tmp/flower'
ln -s '/opt/flower/9a2e425/Flower_f' '/usr/bin/flower'
