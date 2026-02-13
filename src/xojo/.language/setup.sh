#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	curl \
	git \
	libcurl4-openssl-dev \
	libffi-dev \
	libssl-dev \
	pkg-config \
	rustup

rustup install 1.93.1
rustup default 1.93.1

# Need to provide '-include limits.h' when calling g++, otherwise it'll fail:
# "FolderItem.cpp:106:23: error: 'PATH_MAX' was not declared in this scope"
function g++ {
	/usr/bin/g++ -include limits.h "$@"
}

mkdir '/opt/xojoscript'
pushd '/opt/xojoscript'
git clone 'https://github.com/simulanics/XojoScript.git' 'e64a0c5'
pushd 'e64a0c5'
git checkout 'e64a0c5e2ec50dbb4c8b0f44252afee26d39d51b' 2> /dev/null
bash 'build_xojoscript.sh'
source 'build_plugins.sh'
popd; popd
ln -s '/opt/xojoscript/e64a0c5/release-64/xojoscript' '/usr/bin/xojoscript'
