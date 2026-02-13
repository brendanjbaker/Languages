#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	curl \
	libssl-dev \
	openjdk-21-jdk-headless \
	pkg-config \
	rustup

rustup install 1.93.1
rustup default 1.93.1
cargo install whiley
ln -s '/root/.cargo/bin/wy' '/usr/bin/wy'
