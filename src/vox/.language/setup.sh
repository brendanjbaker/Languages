#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	gcc \
	git \
	libc6-dev \
	libcurl4 \
	wget

mkdir '/tmp/d'
pushd '/tmp/d'

download \
	--url 'https://downloads.dlang.org/releases/2.x/2.112.0/dmd_2.112.0-0_amd64.deb' \
	--hash '9bdcd3f93dad986806f494d3bb091cc9b0ab0d7d'

dpkg -i 'dmd_2.112.0-0_amd64.deb'
popd
rm -fr '/tmp/d'

mkdir '/opt/vox'
pushd '/opt/vox'
git clone 'https://github.com/MrSmith33/vox.git' 'b49cc73'
pushd 'b49cc73/source'
sed -i 's/\/\/version = cli/version = cli/g' main.d
dmd -m64 -i 'main.d'
popd; popd
ln -s '/opt/vox/b49cc73/source/main' '/usr/bin/vox'
