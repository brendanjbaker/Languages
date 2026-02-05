#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	unzip \
	wget

mkdir -p '/opt/nial/7'
mkdir '/tmp/nial'
pushd '/tmp/nial'

download \
	--url 'https://github.com/niallang/Nial_Development/releases/download/Originals/Linux64.zip' \
	--hash 'dff6f1ab717708c7a6e9fbbcea7aad318179cec2'

unzip 'Linux64.zip'
mv 'Linux/nial64' '/opt/nial/7'
chmod +x '/opt/nial/7/nial64'
popd
rm -fr '/tmp/nial'
ln -s '/opt/nial/7/nial64' '/usr/bin/nial'
