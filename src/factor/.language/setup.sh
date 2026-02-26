#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	tar \
	wget

mkdir -p '/opt/factor'
mkdir -p '/tmp/factor'
pushd '/tmp/factor'
wget -q 'https://downloads.factorcode.org/releases/0.101/factor-linux-x86-64-0.101.tar.gz'
printf '%s  %s\n' '37ad7d49bd29a281372d0ddb11b468ce69313dba' 'factor-linux-x86-64-0.101.tar.gz' | sha1sum --check -
tar -xvf 'factor-linux-x86-64-0.101.tar.gz' -C '/opt/factor'
popd
pushd '/opt/factor'
mv 'factor' '0.101'
popd
mv '/usr/bin/factor' '/usr/bin/gnu_factor'
ln -s '/opt/factor/0.101/factor' '/usr/bin/factor'
rm -fr '/tmp/factor'
