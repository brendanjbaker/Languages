#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	wget \
	xz-utils

function patch_makefile {
	sed -i 's/O2/O0/g' Makefile
}

mkdir '/opt/language-84'
mkdir '/tmp/language-84'
pushd '/tmp/language-84'
wget -q 'https://norstrulde.org/language84/language84-0.8.tar.xz'
printf '%s  %s\n' 'e3a4961a95a16204f09cb2e12e70acdadc957ea3' 'language84-0.8.tar.xz' | sha1sum --check -
tar -xJf 'language84-0.8.tar.xz' -C '/opt/language-84'
mv '/opt/language-84/language84-0.8' '/opt/language-84/0.8'
pushd '/opt/language-84/0.8'
patch_makefile
make
popd; popd
rm -fr '/tmp/language-84'
ln -s '/opt/language-84/0.8/84' '/usr/bin/84'
