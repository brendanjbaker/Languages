#!/usr/bin/env bash

set -Eeuo pipefail

export DEBIAN_FRONTEND="noninteractive"

mkdir '/opt/c3'
mkdir '/tmp/c3'
pushd '/tmp/c3'

download \
	--url 'https://github.com/c3lang/c3c/releases/download/v0.7.8/c3-linux.tar.gz' \
	--hash 'e35a4a02fc6384f714f7bd9811565ae621b16c9c'

tar -xvf 'c3-linux.tar.gz' -C '/opt/c3'
popd
rm -fr '/tmp/c3'
mv '/opt/c3/c3' '/opt/c3/0.7.8'
ln -s "/opt/c3/0.7.8/c3c" "/usr/bin/c3c"
