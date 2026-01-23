#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	curl \
	git \
	libssl-dev \
	pkg-config \
	rustup

rustup install 1.92.0
rustup default 1.92.0

mkdir '/opt/par'
pushd '/opt/par'
git clone 'https://github.com/faiface/par-lang' '0.1.0'
pushd '0.1.0'
git checkout 'd42c75efa6af4effaf808c4bf09eb7df28b8dd40' 2> /dev/null
cargo install --path .
popd; popd
ln -s '/opt/par/0.1.0/target/release/par-lang' '/usr/bin/par-lang'
