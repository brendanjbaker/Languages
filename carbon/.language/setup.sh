#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y \
	clang \
	git \
	libc++-dev \
	libc++abi-dev \
	libgcc-14-dev \
	lld

mkdir -p "/usr/local/carbon"
pushd "/usr/local/carbon"

declare version="0.0.0-0.nightly.2026.01.04"
declare moniker="carbon_toolchain-$version"
declare filename="$moniker.tar.gz"
declare url="https://github.com/carbon-language/carbon-lang/releases/download/v$version/$filename"

wget \
	--output-document "$filename" \
	--quiet \
	"$url"

tar -xvf "$filename" > /dev/null
rm "$filename"
mv "$moniker" "current"
pushd

ln -s "/usr/local/carbon/current/bin/carbon" "/usr/bin/carbon"
