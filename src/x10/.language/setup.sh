#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	openjdk-21-jdk \
	wget

declare filename='x10-2.6.2_linux_x86_64.tgz'

mkdir -p '/usr/local/x10'
pushd '/usr/local/x10'

download \
	--url "https://master.dl.sourceforge.net/project/x10/x10/2.6.2/$filename?viasf=1" \
	--hash '7591f1fa9d4350f7a47b746a5871fb4232caab53'

tar -xvf "$filename"
rm "$filename"
pushd

ln -s '/usr/local/x10/bin/x10' '/usr/bin/x10'
ln -s '/usr/local/x10/bin/x10c' '/usr/bin/x10c'
