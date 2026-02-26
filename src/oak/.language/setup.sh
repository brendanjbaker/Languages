#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	wget

mkdir -p '/opt/oak/0.3'
pushd '/opt/oak/0.3'
wget -q 'https://github.com/thesephist/oak/releases/download/v0.3/oak-linux'
printf '%s  %s\n' 'dc318e07f3c28a3fdbb46be01b46f0fd0d7d64e5' 'oak-linux' | sha1sum --check -
popd
chmod +x '/opt/oak/0.3/oak-linux'
ln -s '/opt/oak/0.3/oak-linux' '/usr/bin/oak'
