#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	libasound2-dev \
	libcurl4-openssl-dev \
	libglu1-mesa-dev \
	libpng-dev \
	mesa-common-dev \
	wget \
	x11-utils

mkdir -p /opt/qb64pe
wget --quiet 'https://github.com/QB64-Phoenix-Edition/QB64pe/releases/download/v4.2.0/qb64pe_lnx-4.2.0.tar.gz'
tar -xzf 'qb64pe_lnx-4.2.0.tar.gz' -C "/opt"
cd /opt/qb64pe
make clean OS=lnx
make OS=lnx BUILD_QB64=y -j3
ln -s /opt/qb64pe/qb64pe /usr/bin/qb64pe
