#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	openjdk-21-jdk-headless \
	wget

mkdir -p '/opt/x10/2.6.2'
pushd '/opt/x10/2.6.2'
wget -q 'https://master.dl.sourceforge.net/project/x10/x10/2.6.2/x10-2.6.2_linux_x86_64.tgz?viasf=1'
printf '%s  %s\n' '7591f1fa9d4350f7a47b746a5871fb4232caab53' 'x10-2.6.2_linux_x86_64.tgz' | sha1sum --check -
tar -xvf 'x10-2.6.2_linux_x86_64.tgz'
rm 'x10-2.6.2_linux_x86_64.tgz'
pushd

ln -s '/opt/x10/2.6.2/bin/x10' '/usr/bin/x10'
ln -s '/opt/x10/2.6.2/bin/x10c' '/usr/bin/x10c'
