#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	wget

mkdir -p '/opt/ylang/0.2.0'
mkdir '/tmp/ylang'
pushd '/tmp/ylang'
wget -q 'https://github.com/jman-9/ylang/releases/download/v0.2.0/ylang-0.2.0-linux-x86_64.tar.gz'
printf '%s  %s\n' 'f515909ab754eea69882d6e82bad34a4766c3c21' 'ylang-0.2.0-linux-x86_64.tar.gz' | sha1sum --check -
tar -xzf 'ylang-0.2.0-linux-x86_64.tar.gz' -C '/opt/ylang/0.2.0'
popd
rm -fr '/tmp/ylang'
ln -s '/opt/ylang/0.2.0/bin/ylang' '/usr/bin/ylang'
