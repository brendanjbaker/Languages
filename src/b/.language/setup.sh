#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	wget

mkdir '/tmp/b'
pushd '/tmp/b'
wget -q 'https://github.com/sergev/blang/releases/download/v0.1/blang_0.1-1_amd64.deb'
printf '%s  %s\n' '9e556080feed5fd53e3620e0fe7905411716c744' 'blang_0.1-1_amd64.deb' | sha1sum --check -
apt-get install -y --no-install-recommends './blang_0.1-1_amd64.deb'
popd
rm -fr '/tmp/b'
