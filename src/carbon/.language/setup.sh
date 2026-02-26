#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	clang \
	git \
	libc++-dev \
	libc++abi-dev \
	libgcc-14-dev \
	lld \
	wget

mkdir "/usr/local/carbon"
pushd "/usr/local/carbon"
wget -q 'https://github.com/carbon-language/carbon-lang/releases/download/v0.0.0-0.nightly.2026.01.04/carbon_toolchain-0.0.0-0.nightly.2026.01.04.tar.gz'
printf '%s  %s\n' '9eeceb22b6b0586ff727b9f049ec9b3b85fe164e' 'carbon_toolchain-0.0.0-0.nightly.2026.01.04.tar.gz' | sha1sum --check -
tar -xvf 'carbon_toolchain-0.0.0-0.nightly.2026.01.04.tar.gz' > /dev/null
rm 'carbon_toolchain-0.0.0-0.nightly.2026.01.04.tar.gz'
mv 'carbon_toolchain-0.0.0-0.nightly.2026.01.04' '2026.01.04'

ln -s "/usr/local/carbon/2026.01.04/bin/carbon" "/usr/bin/carbon"
