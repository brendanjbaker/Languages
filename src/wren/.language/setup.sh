#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	unzip \
	wget

mkdir '/tmp/wren'
pushd '/tmp/wren'

download \
	--url 'https://github.com/wren-lang/wren-cli/releases/download/0.4.0/wren-cli-linux-0.4.0.zip' \
	--hash 'a1e491a9b56c50e52a382637c58adfb05ec04af8'

unzip 'wren-cli-linux-0.4.0.zip' -d '/opt/wren'
popd
rm -fr '/tmp/wren'
mv '/opt/wren/wren-cli-linux-0.4.0' '/opt/wren/0.4.0'
ln -s '/opt/wren/0.4.0/wren_cli' '/usr/bin/wren_cli'
