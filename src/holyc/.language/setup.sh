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
git checkout '341cdfa41d8307894f4851d2f7fc0a1bba4e0a61' 2> /dev/null
make
make install
popd; popd
ln -s '/opt/holyc/0.0.10-beta/hcc' '/usr/bin/hcc'
