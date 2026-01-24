#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	clang \
	git \
	libc++-dev \
	libc++abi-dev \
	libgcc-14-dev \
	lld \
	wget

mkdir "/usr/local/carbon"
pushd "/usr/local/carbon"

declare version="0.0.0-0.nightly.2026.01.04"
declare moniker="carbon_toolchain-$version"
declare filename="$moniker.tar.gz"

download \
	--url "https://github.com/carbon-language/carbon-lang/releases/download/v$version/$filename" \
	--hash '9eeceb22b6b0586ff727b9f049ec9b3b85fe164e'

tar -xvf "$filename" > /dev/null
rm "$filename"
mv "$moniker" "current"

ln -s "/usr/local/carbon/current/bin/carbon" "/usr/bin/carbon"
