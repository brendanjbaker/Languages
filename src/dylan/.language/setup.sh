#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

# Note: The language uses git to download neeed files/modules/etc.

apt-get install -y --no-install-recommends \
	build-essential \
	bzip2 \
	ca-certificates \
	git \
	wget

mkdir '/opt/dylan'
mkdir '/tmp/dylan'
pushd '/tmp/dylan'
wget -q 'https://github.com/dylan-lang/opendylan/releases/download/v2026.1.0/opendylan-2026.1-x86_64-linux.tar.bz2'
printf '%s  %s\n' '129701ece9104ff5df523ea67ed29559ebad1fba' 'opendylan-2026.1-x86_64-linux.tar.bz2' | sha1sum --check -
tar -xf 'opendylan-2026.1-x86_64-linux.tar.bz2' -C '/opt/dylan'
mv '/opt/dylan/opendylan-2026.1' '/opt/dylan/2026.1'
popd
rm -fr '/tmp/dylan'
ln -s '/opt/dylan/2026.1/bin/dylan-compiler' '/usr/bin/dylan-compiler'
ln -s '/opt/dylan/2026.1/bin/deft' '/usr/bin/deft'
