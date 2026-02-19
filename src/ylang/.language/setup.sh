#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	wget

mkdir -p '/opt/ylang/0.1.4'
mkdir '/tmp/ylang'
pushd '/tmp/ylang'

download \
	--url 'https://github.com/jman-9/ylang/releases/download/v0.1.4/ylang-0.1.4-linux-x86_64.tar.gz' \
	--hash 'ccb7d8c221f68acccf079d22e9301133355896f8'

tar -xzf 'ylang-0.1.4-linux-x86_64.tar.gz' -C '/opt/ylang/0.1.4'
popd
rm -fr '/tmp/ylang'
ln -s '/opt/ylang/0.1.4/bin/ylang' '/usr/bin/ylang'
