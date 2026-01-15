#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	libasound2-dev \
	libcurl4-openssl-dev \
	libglu1-mesa-dev \
	libpng-dev \
	mesa-common-dev \
	wget \
	x11-utils

mkdir '/opt/qb64pe'
mkdir '/tmp/basic'
pushd '/tmp/basic'

download \
	--url 'https://github.com/QB64-Phoenix-Edition/QB64pe/releases/download/v4.2.0/qb64pe_lnx-4.2.0.tar.gz' \
	--hash '059c7f79d4db432499a0afc6d7d1587b618872ed'

tar -xzf 'qb64pe_lnx-4.2.0.tar.gz' -C '/opt/qb64pe'
popd
rm -fr '/tmp/basic'
mv '/opt/qb64pe/qb64pe' '/opt/qb64pe/4.2.0'
pushd '/opt/qb64pe/4.2.0'
make clean OS=lnx
make OS=lnx BUILD_QB64=y -j3
ln -s '/opt/qb64pe/4.2.0/qb64pe' '/usr/bin/qb64pe'
popd
