#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	wget \
	build-essential \
	libxxf86vm-dev \
	libxine2-dev \
	unixodbc-dev \
	libsdl1.2-dev \
	libsdl2-dev \
	libssl-dev \
	libvlc-dev \
	libgtk2.0-dev \
	libgtk-3-dev \
	libwebkit2gtk-4.1-dev

mkdir '/opt/purebasic'
mkdir '/tmp/purebasic'
pushd '/tmp/purebasic'
wget -q 'https://www.purebasic.com/download/purebasic3-demo_x64.tgz'
printf '%s  %s\n' 'b3e1b6d252f9a11b70a6bf26e61fad78ca7560a0' 'purebasic3-demo_x64.tgz' | sha1sum --check -
tar -xf 'purebasic3-demo_x64.tgz' -C '/opt/purebasic'
popd
rm -fr '/tmp/purebasic'
mv '/opt/purebasic/purebasic_demo' '/opt/purebasic/3'
ln -s '/opt/purebasic/3/compilers/pbcompiler' '/usr/bin/pbcompiler'
