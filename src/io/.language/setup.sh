#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	unzip \
	wget

mkdir '/tmp/io'
pushd '/tmp/io'
wget -q 'https://iobin.suspended-chord.info/linux/iobin-linux-x64-deb-current.zip'
printf '%s  %s\n' 'fb7f59563a3e09e485a5dc2e7fa140f6cd9deb64' 'iobin-linux-x64-deb-current.zip' | sha1sum --check -
unzip 'iobin-linux-x64-deb-current.zip'
apt-get install -y --no-install-recommends './IoLanguage-2013.11.04-Linux-x64.deb'
popd
rm -fr '/tmp/io'
