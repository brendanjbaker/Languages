#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	wget

mkdir -p '/opt/pico'
pushd '/opt/pico'
wget -q 'ftp://pico.vub.ac.be/version2.0/Linux/tpico-2.0pl12.tar.gz'
printf '%s  %s\n' 'c1e36ae70383569ce188a154419feb5dfd41bfb2' 'tpico-2.0pl12.tar.gz' | sha1sum --check -
tar -xzf 'tpico-2.0pl12.tar.gz'
mv 'tpico-2.0pl12' '2.0pl12'
pushd '2.0pl12'
make -C tpico install
popd; popd
