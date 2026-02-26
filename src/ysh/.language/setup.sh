#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	wget

mkdir -p '/tmp/oils'
pushd '/tmp/oils'
wget -q 'https://oils.pub/download/oils-for-unix-0.37.0.tar.gz'
printf '%s  %s\n' '1fb279f2742c0eee46871e977434fce051ec6ae1' 'oils-for-unix-0.37.0.tar.gz' | sha1sum --check -
tar -xzf 'oils-for-unix-0.37.0.tar.gz'
pushd 'oils-for-unix-0.37.0'
bash configure
bash _build/oils.sh
bash install
popd; popd
rm -fr '/tmp/oils'
