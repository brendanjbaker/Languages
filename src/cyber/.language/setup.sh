#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	wget

mkdir -p '/opt/cyber/0.4-DEV'
mkdir '/tmp/cyber'
pushd '/tmp/cyber'
wget -q 'https://github.com/fubark/cyber/releases/download/latest/cyber-linux-x64.tar.gz'
printf '%s  %s\n' '6aed7256459c8ffd3a04d6e22ce144b0c8b95dda' 'cyber-linux-x64.tar.gz' | sha1sum --check
tar -xzf 'cyber-linux-x64.tar.gz' -C '/opt/cyber/0.4-DEV'
popd
rm -fr '/tmp/cyber'
ln -s '/opt/cyber/0.4-DEV/cyber' '/usr/bin/cyber'
