#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	clang \
	openjdk-21-jdk-headless \
	unzip \
	wget

mkdir -p '/opt/vale/0.2.0'
mkdir '/tmp/vale'
pushd '/tmp/vale'

download \
	--url 'https://github.com/ValeLang/Vale/releases/download/v0.2.0/Vale-Ubuntu-0.2.0.28.zip' \
	--hash '5fd8e31d62957c1c03a6a7d2aebc50d7aa009a69'

unzip -q 'Vale-Ubuntu-0.2.0.28.zip' -d '/opt/vale/0.2.0'
popd
rm -fr '/tmp/vale'
