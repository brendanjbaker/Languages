#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	chezscheme \
	libgmp-dev \
	wget

mkdir '/opt/idris'
mkdir '/tmp/idris'
pushd '/tmp/idris'
wget -q 'https://www.idris-lang.org/releases/idris2-0.8.0.tgz'
# printf '%s  %s\n' 'fbbb666a7efecdce77dbe60d4b1174a6c477d562' 'packages-microsoft-prod.deb' | sha1sum --check -
tar -xf 'idris2-0.8.0.tgz' -C '/opt/idris'
mv '/opt/idris/Idris2-0.8.0' '/opt/idris/2-0.8.0'
pushd '/opt/idris/2-0.8.0'
make bootstrap SCHEME='scheme'
make install
popd; popd
rm -fr '/tmp/idris'
ln -s '/opt/idris/2-0.8.0/build/exec/idris2' '/usr/bin/idris2'
