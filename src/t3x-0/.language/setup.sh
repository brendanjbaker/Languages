#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	libncurses-dev \
	make \
	unzip \
	wget

# shellcheck disable=SC2016
function configure {
	pushd '/opt/t3x-0/46a'

	# Change configuration to x86_64 (aka "unix-686").
	sed -i 's/^  HOST=\tunix-386$/# HOST=\tunix-386/g' Makefile
	sed -i 's/^  CFLAGS+= -m32\t/# CFLAGS+= -m32\t/g' Makefile
	sed -i 's/^# HOST=\tunix-686$/  HOST=\tunix-686/g' Makefile

	# Change installation directory from "/u/bin" to "/usr/bin".
	sed -i 's/^BINDIR=\t\/u\/bin/BINDIR=\t\/usr\/bin/g' Makefile

	# Uncomment some suggested linking-related options.
	sed -i 's/# CFLAGS=$CFLAGS" -fno-PIE -no-pie/  CFLAGS=$CFLAGS" -fno-PIE -no-pie/g' Makefile
	sed -i 's/# CFLAGS=$CFLAGS" -fno-PIE -no-pie/  CFLAGS=$CFLAGS" -fno-PIE -no-pie/g' bin/build.sh
	sed -i 's/# CFLAGS=$CFLAGS" -fno-PIE -no-pie/  CFLAGS=$CFLAGS" -fno-PIE -no-pie/g' bin/tx0.sh

	popd
}

mkdir '/tmp/t3x-0'
pushd '/tmp/t3x-0'
wget -q 'https://t3x.org/t3x/0/t3x0-46a.zip'
mkdir '/opt/t3x-0'
unzip 't3x0-46a.zip' -d '/opt/t3x-0'
mv '/opt/t3x-0/t3x0' '/opt/t3x-0/46a'
popd
rm -fr '/tmp/t3x-0'
pushd '/opt/t3x-0/46a'
configure
make all-native
make triple test
make install-native
popd
