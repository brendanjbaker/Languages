#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	clang \
	git \
	libpolly-18-dev \
	libzstd-dev \
	llvm-18-dev \
	pkg-config \
	rustup \
	zlib1g-dev

export LLVM_SYS_180_PREFIX='/usr/lib/llvm-18'

rustup install 1.93.1
rustup default 1.93.1
mkdir '/opt/jovial'
pushd '/opt/jovial'
git clone 'https://github.com/Zaneham/jovial-compiler.git' '059c643'
pushd '059c643'
git checkout '059c6437a8a46a0f06e15a1bffafcfe25b631d9e' 2> /dev/null
cargo build --release
popd
ln -s '/opt/jovial/059c643/target/release/jovialc' '/usr/bin/jovialc'
