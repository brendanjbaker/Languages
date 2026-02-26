#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	unzip \
	wget

mkdir -p '/opt/v'
mkdir '/tmp/v'
pushd '/tmp/v'
wget -q 'https://github.com/vlang/v/releases/download/0.5/v_linux.zip'
printf '%s  %s\n' '3959db96578ca4c9a57a02c9b26c893fe6cb1657' 'v_linux.zip' | sha1sum --check -
unzip 'v_linux.zip' -d '/opt/v' > /dev/null
rm 'v_linux.zip'
popd
pushd '/opt/v'
mv v '0.5'
ln -s '/opt/v/0.5/v' '/usr/bin/v'
popd
