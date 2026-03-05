#!/usr/bin/env bash

# The makefile assumes the repository root directory is named "BBCSDL". In our
# case, that isn't true. Symlink it so it finds "BBCSDL" when it looks for it.
function apply_patch {
	ln -s '/opt/basic/3b306af' '/opt/basic/BBCSDL'
}

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git \
	libsdl2-dev \
	libsdl2-image-dev \
	libsdl2-net-dev \
	libsdl2-ttf-dev \
	nasm

mkdir '/opt/basic'
pushd '/opt/basic'
git clone 'https://github.com/rtrussell/BBCSDL.git' '3b306af'
pushd '3b306af'
git checkout '3b306af583f71fa1550cd5a7e17e563bb05334fa' 2> /dev/null
apply_patch
pushd 'bin/linux'
make
popd
pushd 'console/linux'
make
popd; popd; popd
ln -s '/opt/basic/3b306af/console/linux/bbcbasic' '/usr/bin/bbcbasic'
