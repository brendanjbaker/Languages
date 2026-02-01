#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	gcc \
	git \
	make \
	python3

mkdir -p '/opt/toi'
pushd '/opt/toi'
git clone --depth 1 'https://github.com/bannatech/language.git' 'bd24614'
pushd 'bd24614'
git checkout 'bd24614ca384a69be2a3ebaa8d4c18183a0f77ff' 2> /dev/null
pushd 'src/vm'
make CC="gcc -fcommon"
popd; popd
ln -s '/opt/toi/bd24614/src/lc/toil' '/usr/bin/toil'
ln -s '/opt/toi/bd24614/src/vm/toi' '/usr/bin/toi'
