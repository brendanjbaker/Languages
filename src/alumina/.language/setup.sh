#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	libclang-dev \
	git \
	nodejs \
	rustup

# Optional dependency: libbacktrace

mkdir '/opt/libbacktrace'
pushd '/opt/libbacktrace'
git clone 'https://github.com/ianlancetaylor/libbacktrace.git' 'b9e4006'
pushd 'b9e4006'
git checkout 'b9e40069c0b47a722286b94eb5231f7f05c08713' 2> /dev/null
bash configure
make
make install
popd; popd

# Now, onto Alumina itself.

rustup install 1.93.1
rustup default 1.93.1
cargo install tree-sitter-cli
mkdir '/opt/alumina'
pushd '/opt/alumina'
git clone 'https://github.com/alumina-lang/alumina.git' 'd98b9bd'
pushd 'd98b9bd'
git checkout 'd98b9bdaf41e6118eb0da048e23b1eea6d29c59e' 2> /dev/null
make alumina-boot
popd; popd
ln -s '/opt/alumina/d98b9bd/alumina-boot' '/usr/bin/alumina-boot'
