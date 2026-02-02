#!/usr/bin/env bash

apt-get install -y --no-install-recommends \
	autoconf \
	automake \
	bison \
	build-essential \
	ca-certificates \
	flex \
	git \
	guile-3.0-dev \
	libtool \
	texinfo

mkdir '/opt/epsilon'
pushd '/opt/epsilon'
git clone 'https://git.savannah.gnu.org/git/epsilon.git' '7323d95'
pushd '7323d95'
git checkout '7323d951a28492205698312689d13b7f8fa3b8aa' 2> /dev/null
bash autogen.sh
bash configure
make -j"$(nproc)" CFLAGS="-Wno-implicit-function-declaration -Wno-int-conversion"
make install
popd; popd
