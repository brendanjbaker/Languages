#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cmake \
	git

mkdir '/opt/holyc'
pushd '/opt/holyc'
git clone 'https://github.com/Jamesbarford/holyc-lang.git' '0.0.10-beta'
pushd '0.0.10-beta'
git checkout 'beta-v0.0.10' 2> /dev/null
make
make install
popd; popd
ln -s '/opt/holyc/0.0.10-beta/hcc' '/usr/bin/hcc'
