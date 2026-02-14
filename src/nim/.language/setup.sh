#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	wget \
	xz-utils

mkdir '/opt/nim'
mkdir '/tmp/nim'
pushd '/tmp/nim'
wget -q 'https://nim-lang.org/download/nim-2.2.6-linux_x64.tar.xz'
tar -xJf 'nim-2.2.6-linux_x64.tar.xz' -C '/opt/nim'
mv '/opt/nim/nim-2.2.6' '/opt/nim/2.2.6'
ln -s '/opt/nim/2.2.6/bin/nim' '/usr/bin/nim'
popd
rm -fr '/tmp/nim'
