#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	wget

mkdir '/tmp/unison'
pushd '/tmp/unison'
wget -q 'https://github.com/unisonweb/unison/releases/download/release%2F1.1.1/ucm-linux-x64.tar.gz'
printf '%s  %s\n' 'c48759677e7d4ad6150bb106bcafed494ac217a6' 'ucm-linux-x64.tar.gz' | sha1sum --check -
mkdir -p '/opt/unison/1.1.1'
tar -xzf 'ucm-linux-x64.tar.gz' -C '/opt/unison/1.1.1'
ln -s '/opt/unison/1.1.1/ucm' '/usr/bin/ucm'
popd
rm -fr '/tmp/unison'
mkdir -p '/app'
pushd '/app'
ucm <<< "project.create program"
popd
