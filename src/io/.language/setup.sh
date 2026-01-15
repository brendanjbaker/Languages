#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	cmake \
	freeglut3-dev \
	libdbi0-dev \
	libevent-dev \
	libffi-dev \
	libflac-dev \
	libgl1-mesa-dev \
	libglu1-mesa-dev \
	libgmp3-dev \
	libjpeg62-turbo-dev \
	libloudmouth1-dev \
	liblzo2-dev \
	libmariadb-dev \
	libmemcached-dev \
	libogg-dev \
	libpcre2-dev \
	libpng-dev \
	libpq-dev \
	libreadline-dev \
	libsamplerate0-dev \
	libsndfile1-dev \
	libsqlite3-dev \
	libssl-dev \
	libtag1-dev \
	libtheora-dev \
	libtiff-dev \
	libtokyocabinet-dev \
	libvorbis-dev \
	libxi-dev \
	libxml2-dev \
	libxmu-dev \
	libyajl-dev \
	ncurses-dev \
	python-dev-is-python3 \
	uuid-dev \
	zlib1g-dev

mkdir '/tmp/io'
pushd '/tmp/io'

download \
	--url 'https://iobin.suspended-chord.info/linux/iobin-linux-x64-deb-current.zip' \
	--hash 'fb7f59563a3e09e485a5dc2e7fa140f6cd9deb64'

unzip 'iobin-linux-x64-deb-current.zip'
dpkg -i 'IoLanguage-2013.11.04-Linux-x64.deb'
ldconfig
popd
rm -fr '/tmp/io'
