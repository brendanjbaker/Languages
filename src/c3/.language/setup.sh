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
wget -q 'https://github.com/c3lang/c3c/releases/download/v0.7.8/c3-linux.tar.gz'
printf '%s  %s\n' 'e35a4a02fc6384f714f7bd9811565ae621b16c9c' 'c3-linux.tar.gz' | sha1sum --check
tar -xvf 'c3-linux.tar.gz' -C '/opt/c3'
popd
rm -fr '/tmp/c3'
mv '/opt/c3/c3' '/opt/c3/0.7.8'
ln -s "/opt/c3/0.7.8/c3c" "/usr/bin/c3c"
