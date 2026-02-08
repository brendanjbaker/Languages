#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	libicu76 \
	wget

mkdir '/tmp/elk'
pushd '/tmp/elk'
download --url 'https://github.com/PaddiM8/elk/releases/download/v0.0.6/linux-x64.tar.xz'
tar -xvf 'linux-x64.tar.xz' -C /
popd
rm -fr '/tmp/elk'
