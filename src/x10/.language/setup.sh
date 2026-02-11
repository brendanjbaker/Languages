#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	openjdk-21-jdk-headless \
	wget

declare filename='x10-2.6.2_linux_x86_64.tgz'

mkdir -p '/opt/x10/2.6.2'
pushd '/opt/x10/2.6.2'

download \
	--url "https://master.dl.sourceforge.net/project/x10/x10/2.6.2/$filename?viasf=1" \
	--hash '7591f1fa9d4350f7a47b746a5871fb4232caab53'

tar -xvf "$filename"
rm "$filename"
pushd

ln -s '/opt/x10/2.6.2/bin/x10' '/usr/bin/x10'
ln -s '/opt/x10/2.6.2/bin/x10c' '/usr/bin/x10c'
