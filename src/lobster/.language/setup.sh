#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	libopengl0 \
	mesa-common-dev \
	unzip \
	wget

mkdir -p '/tmp/lobster'
mkdir -p '/opt/lobster/2025.4'
pushd '/tmp/lobster'

download \
	--url 'https://github.com/aardappel/lobster/releases/download/v2025.4/lobster_linux_release.zip' \
	--hash '52460852e806d3ff995a5d9a103c2e736b05a95c'

unzip 'lobster_linux_release.zip' -d '/opt/lobster/2025.4' > /dev/null
popd
ln -s '/opt/lobster/2025.4/bin/lobster' '/usr/bin/lobster'
rm -fr '/tmp/lobster'
