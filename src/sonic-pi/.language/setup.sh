#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	alsa-utils \
	build-essential \
	cmake ninja-build \
	compton \
	elixir \
	erlang-dev \
	erlang-xmerl \
	git \
	libasound2-dev \
	libaubio-dev \
	libboost-all-dev \
	libegl1-mesa-dev \
	libpng-dev \
	libqt6opengl6-dev \
	libqt6svg6-dev \
	librtmidi-dev \
	libspa-0.2-jack \
	libssl-dev \
	libwayland-dev \
	libx11-dev \
	libxext-dev \
	libxft-dev \
	libxkbcommon-dev \
	m4 \
	pipewire-jack \
	qpwgraph \
	qt6-tools-dev \
	qt6-tools-dev-tools \
	qt6-wayland \
	ruby-dev \
	sc3-plugins-server \
	supercollider-server

mkdir -p '/opt/sonic-pi/4.6.0'
pushd '/tmp'
git clone 'https://github.com/sonic-pi-net/sonic-pi.git' 'sonic-pi'
pushd 'sonic-pi'
git checkout '9f8f021ff28e13b336a9cb348fee396012629c87' 2> /dev/null
./linux-build-all.sh
popd; popd
mv '/tmp/sonic-pi/sonic-pi' '/opt/sonic-pi/4.6.0'
rm -fr '/tmp/sonic-pi'
gem install 'sonic-pi-cli' -v '0.2.0'
#gem install 'sonic-pi-cli4' -v '0.1.4'
