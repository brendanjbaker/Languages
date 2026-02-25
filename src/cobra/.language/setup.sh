#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	mono-complete

mkdir -p '/opt/cobra'
pushd '/opt/cobra'
git clone --depth 1 'https://github.com/gorauskas/cobra-lang' '0.9.6'
pushd '0.9.6'
git checkout 'cfa8fe35710dcdd33a3191f2a26fa0711a8014a1' 2> /dev/null
popd; popd
