#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	tar \
	wget

mkdir -p '/opt/factor'
mkdir -p '/tmp/factor'
pushd '/tmp/factor'
wget --quiet 'https://downloads.factorcode.org/releases/0.101/factor-linux-x86-64-0.101.tar.gz'
tar -xvf 'factor-linux-x86-64-0.101.tar.gz' -C '/opt/factor'
popd
pushd '/opt/factor'
mv 'factor' '0.101'
popd
mv '/usr/bin/factor' '/usr/bin/gnu_factor'
ln -s '/opt/factor/0.101/factor' '/usr/bin/factor'
rm -fr '/tmp/factor'
