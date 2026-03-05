#!/usr/bin/env bash

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
	locales \
	nodejs \
	readline-common \
	wget \
	zlib1g-dev

# export LANG='en_US.UTF-8'
# export LANGUAGE='en_US:en'
# export LC_ALL='en_US.UTF-8'

export LC_ALL='C.UTF-8'

echo 'C.UTF-8' > /etc/locale.gen
locale-gen
mkdir '/opt/kip'
pushd '/opt/kip'
git clone 'https://github.com/kip-dili/kip.git' 'ef9f9b0'
pushd 'ef9f9b0'
git checkout 'ef9f9b02d774c487e55a40ddbf22b7c600bbe3d8' 2> /dev/null
stack build --no-test --no-bench
stack install --local-bin-path='/usr/bin'
popd; popd
