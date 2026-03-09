#!/usr/bin/env bash

# Fetching dependencies seems to fail frequently with various HTTP errors. Use
# the 'retry' program to attempt to fight through it. (Obviously, not ideal.)
function build_with_retry {
	retry --times=100 --delay=1 \
		stack build --no-test --no-bench
}

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	curl \
	foma \
	git \
	gnupg \
	haskell-stack \
	libfoma-dev \
	libgmp-dev \
	libgmpxx4ldbl \
	libnuma1 \
	libreadline8t64 \
	libtinfo-dev \
	libyaml-0-2 \
	nodejs \
	readline-common \
	retry \
	wget \
	zlib1g-dev

export LC_ALL='C.UTF-8'

mkdir '/opt/kip'
pushd '/opt/kip'
git clone 'https://github.com/kip-dili/kip.git' 'ef9f9b0'
pushd 'ef9f9b0'
git checkout 'ef9f9b02d774c487e55a40ddbf22b7c600bbe3d8' 2> /dev/null
build_with_retry
stack install --local-bin-path='/usr/bin'
popd; popd
