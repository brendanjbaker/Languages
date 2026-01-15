#!/usr/bin/env bash

apt-get install -y --no-install-recommends \
	libc6 \
	libstdc++6 \
	openjdk-21-jdk \
	unzip \
	wget

mkdir -p '/opt/coldfusion'
mkdir -p '/tmp/coldfusion'
pushd '/tmp/coldfusion'

download \
	--url 'https://cfdownload.adobe.com/pub/adobe/coldfusion/2025/zipinstaller/ColdFusion_2025_WWEJ_linux64.zip' \
	--hash '0bd0ba968c9b15f30c7878edfe5fe90e75216e55'

unzip 'ColdFusion_2025_WWEJ_linux64.zip'
unzip 'ColdFusion_WWEJ_linux64.zip' -d '/opt/coldfusion'
popd
pushd '/opt/coldfusion'
mv 'ColdFusion' '2025'
pushd '2025'

./cfusion/bin/cfinstall.sh <<- EOF
	/opt/coldfusion/2025
	Y
	2
	3
	0.0.0.0
	password
	password
	8500
	password
	password
	root
	1
	Y
	EOF
