#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	lua-filesystem \
	lua5.4

mkdir '/opt/erde'
pushd '/opt/erde'
git clone 'https://github.com/erde-lang/erde.git' '1.0.0-1'
pushd '1.0.0-1'
git checkout '5698c9203d4afc0ec94aa9733e194c81897504df' 2> /dev/null
