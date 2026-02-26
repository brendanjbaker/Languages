#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	gcc \
	libc6-dev \
	libcurl4 \
	wget

mkdir '/tmp/d'
pushd '/tmp/d'
wget -q 'https://downloads.dlang.org/releases/2.x/2.112.0/dmd_2.112.0-0_amd64.deb'
printf '%s  %s\n' '9bdcd3f93dad986806f494d3bb091cc9b0ab0d7d' 'dmd_2.112.0-0_amd64.deb' | sha1sum --check -
dpkg -i 'dmd_2.112.0-0_amd64.deb'
popd
rm -fr '/tmp/d'
