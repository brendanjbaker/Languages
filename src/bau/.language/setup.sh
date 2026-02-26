#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git \
	openjdk-21-jdk-headless

mkdir '/opt/bau'
pushd '/opt/bau'
git clone 'https://github.com/thomasmueller/bau-lang.git' 'f88d379'
pushd 'f88d379'
git checkout 'f88d379df2bca9788a240a5d1ea3cf42ef787e59' 2> /dev/null
make
