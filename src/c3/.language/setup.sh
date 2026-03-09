#!/usr/bin/env bash

set -Eeuo pipefail

export DEBIAN_FRONTEND="noninteractive"

apt-get install --no-install-recommends -y \
	build-essential \
	ca-certificates \
	libcurl4 \
	libxml2 \
	wget

mkdir '/opt/c3'
mkdir '/tmp/c3'
pushd '/tmp/c3'
wget -q 'https://github.com/c3lang/c3c/releases/download/v0.7.10/c3-linux.tar.gz'
printf '%s  %s\n' 'e5fc979dcb2b2d40e26908501026d5d41dade347' 'c3-linux.tar.gz' | sha1sum --check
tar -xvf 'c3-linux.tar.gz' -C '/opt/c3'
popd
rm -fr '/tmp/c3'
mv '/opt/c3/c3' '/opt/c3/0.7.10'
ln -s "/opt/c3/0.7.10/c3c" "/usr/bin/c3c"
