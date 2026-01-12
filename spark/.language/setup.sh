#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	gnat \
	gprbuild \
	unzip

mkdir -p '/tmp/alr'
pushd '/tmp/alr'
wget --quiet 'https://github.com/alire-project/alire/releases/download/v2.1.0/alr-2.1.0-bin-x86_64-linux.zip'
unzip 'alr-2.1.0-bin-x86_64-linux.zip'
mkdir -p '/opt/alr/2.1.0/bin'
mv 'bin/alr' '/opt/alr/2.1.0/bin'
popd
ln -s '/opt/alr/2.1.0/bin/alr' '/usr/bin/alr'
rm -fr '/tmp/alr'

mkdir -p '/opt/gnat_native'
pushd '/opt/gnat_native'
alr toolchain --select gnat_native=15.2.1
popd

mkdir -p '/opt/gnatprove'
pushd '/opt/gnatprove'
alr get gnatprove=15.1.0
mv 'gnatprove_'* '15.1.0'
ln -s '/opt/gnatprove/15.1.0/bin/gnatprove' '/usr/bin/gnatprove'
popd
