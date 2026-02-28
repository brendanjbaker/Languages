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

rustup install 1.93.1
rustup default 1.93.1

mkdir '/opt/par'
pushd '/opt/par'
git clone 'https://github.com/faiface/par-lang.git' '7c93277'
pushd '7c93277'
git checkout '7c93277a1595bfb6bc6845377a1c6b53b85eeee1' 2> /dev/null
cargo install --path . --locked
popd; popd
ln -s '/opt/par/7c93277/target/release/par-lang' '/usr/bin/par-lang'
