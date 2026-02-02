#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install --no-install-recommends -y \
	build-essential \
	ca-certificates \
	gcc \
	git \
	make

mkdir -p '/opt/c2'
pushd '/opt/c2'
git clone 'https://github.com/c2lang/c2compiler.git' '7b17e77'
pushd '7b17e77'
git checkout '7b17e77' 2> /dev/null
git submodule update --init --recursive --depth 1
source env.sh
make -j"$(nproc)"
ln -s '/opt/c2/7b17e77/output/c2c/c2c' '/usr/bin/c2c'
ln -s '/opt/c2/7b17e77/output/c2tags/c2tags' '/usr/bin/c2tags'
ln -s '/opt/c2/7b17e77/libs' '/usr/lib/c2_libs'
ln -s '/opt/c2/7b17e77/output/plugins' '/usr/lib/c2_plugins'
popd; popd
