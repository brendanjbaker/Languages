#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends wget

mkdir -p '/opt/oak/0.3'
pushd '/opt/oak/0.3'

download \
	--url 'https://github.com/thesephist/oak/releases/download/v0.3/oak-linux' \
	--hash 'dc318e07f3c28a3fdbb46be01b46f0fd0d7d64e5'

popd
chmod +x '/opt/oak/0.3/oak-linux'
ln -s '/opt/oak/0.3/oak-linux' '/usr/bin/oak'
