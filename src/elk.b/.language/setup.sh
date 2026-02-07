#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends
	build-essential \
	ca-certificates \
	git \
	go \
	make

mkdir '/opt/elk'
pushd '/opt/elk'
git clone 'https://github.com/elk-language/elk.git' 'fa2c531'
git checkout 'fa2c5315a5fda379873efe453dfb8ffc41dfe8f9' 2> /dev/null
make
popd
