#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

dpkg --add-architecture i386
apt-get update

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	gcc-multilib \
	libc6-dev-i386 \
	libncurses-dev:i386 \
	libreadline-dev:i386 \
	wget

function patch_gcc {
	mv '/usr/bin/gcc' '/usr/bin/gcc.original'
	echo 'gcc.original -std=gnu89 "$@"' > '/usr/bin/gcc'
	chmod +x '/usr/bin/gcc'
}

function patch_man {
	mkdir -p /usr/local/man/man1
}

mkdir -p '/opt/pico'
pushd '/opt/pico'
wget -q 'ftp://pico.vub.ac.be/version2.0/Linux/tpico-2.0pl12.tar.gz'
printf '%s  %s\n' 'c1e36ae70383569ce188a154419feb5dfd41bfb2' 'tpico-2.0pl12.tar.gz' | sha1sum --check -
tar -xzf 'tpico-2.0pl12.tar.gz'
mv 'tpico-2.0pl12' '2.0pl12'
pushd '2.0pl12/tpico'
patch_gcc
patch_man
make install
popd; popd
