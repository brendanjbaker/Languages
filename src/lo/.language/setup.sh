#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	wget \
	xz-utils

mkdir '/opt/wasmtime'
mkdir '/tmp/wasmtime'
pushd '/tmp/wasmtime'
wget -q 'https://github.com/bytecodealliance/wasmtime/releases/download/v42.0.1/wasmtime-v42.0.1-x86_64-linux.tar.xz'
printf '%s  %s\n' '950a67d4980d23bef2b16bd2a3f2cce187048a09' 'wasmtime-v42.0.1-x86_64-linux.tar.xz' | sha1sum --check -
tar -xJf 'wasmtime-v42.0.1-x86_64-linux.tar.xz' -C '/opt/wasmtime'
mv '/opt/wasmtime/wasmtime-v42.0.1-x86_64-linux' '/opt/wasmtime/42.0.1'
popd
ln -s '/opt/wasmtime/42.0.1/wasmtime' '/usr/bin/wasmtime'

mkdir '/opt/lo'
pushd '/opt/lo'
git clone 'https://github.com/glebbash/LO.git' '471f917'
pushd '471f917'
git checkout '471f9170df2f7ca1253d3c1a65a8bebb6dacc92b' 2> /dev/null
popd; popd

mkdir -p '/app'
cp --recursive '/opt/lo/471f917/examples/lib' '/app/lib'
