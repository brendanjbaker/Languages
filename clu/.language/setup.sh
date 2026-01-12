#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	libgc-dev \
	git

mkdir -p '/opt/pclu'
pushd '/opt/pclu'
git clone 'https://github.com/npe9/pclu.git' 'current'
pushd 'current'
export CLUHOME='/opt/pclu/current'
git checkout '3fd06ff'
