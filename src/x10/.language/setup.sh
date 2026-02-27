#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	openjdk-21-jdk-headless \
	wget

mkdir -p '/opt/x10/2.6.2'
mkdir '/tmp/x10'
pushd '/tmp/x10'
wget -q 'https://master.dl.sourceforge.net/project/x10/x10/2.6.2/x10-2.6.2_linux_x86_64.tgz'
printf '%s  %s\n' '7591f1fa9d4350f7a47b746a5871fb4232caab53' 'x10-2.6.2_linux_x86_64.tgz' | sha1sum --check -
tar -xf 'x10-2.6.2_linux_x86_64.tgz' -C '/opt/x10/2.6.2'
popd
rm -fr '/tmp/x10'
ln -s '/opt/x10/2.6.2/bin/x10' '/usr/bin/x10'
ln -s '/opt/x10/2.6.2/bin/x10c' '/usr/bin/x10c'
