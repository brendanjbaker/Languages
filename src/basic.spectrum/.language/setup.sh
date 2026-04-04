#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	libasound2 \
	libncurses6 \
	libpulse0 \
	libsdl1.2debian \
	libxxf86vm1 \
	python3 \
	wget

cat >> /etc/apt/sources.list.d/debian.sources <<- EOF
	Types: deb
	URIs: http://deb.debian.org/debian
	Suites: trixie
	Components: non-free
	Signed-By: /usr/share/keyrings/debian-archive-keyring.pgp
	EOF

apt-get update
apt-get install -y --no-install-recommends \
	spectrum-roms

mkdir '/opt/basic'
pushd '/opt/basic'
git clone 'https://github.com/boriel-basic/zxbasic.git' '1.18.7'
pushd '1.18.7'
git checkout 'c9a21621410c0a30b3ffc6b24bf45067110855f6' 2> /dev/null
popd; popd
ln -s '/opt/basic/1.18.7/zxbc.py' '/usr/bin/zxbc'

mkdir '/opt/zesarux'
mkdir '/tmp/zesarux'
pushd '/tmp/zesarux'
wget -q 'https://github.com/chernandezba/zesarux/releases/download/ZEsarUX-12.1/ZEsarUX_linux-12.1-debian12_x86_64.tar.gz'
printf '%s  %s\n' 'd2f91fa717e1c1d4a87db1a10fac3642e04f11c5' 'ZEsarUX_linux-12.1-debian12_x86_64.tar.gz' | sha1sum --check
tar -xzf 'ZEsarUX_linux-12.1-debian12_x86_64.tar.gz' -C '/opt/zesarux'
mv '/opt/zesarux/ZEsarUX-12.1' '/opt/zesarux/12.1'
ln -s '/opt/zesarux/12.1/zesarux' '/usr/bin/zesarux'
mkdir -p '/app'
ln -s '/usr/share/spectrum-roms/48.rom' '/app/48.rom'
ln -s '/opt/zesarux/12.1/128.rom' '/app/128.rom'
ln -s '/opt/zesarux/12.1/zx80.rom' '/app/zx80.rom'
