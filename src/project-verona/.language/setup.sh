#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	clang \
	clang-format \
	clang-tools \
	cmake \
	git \
	libclang-dev \
	libstdc++-14-dev \
	llvm-dev \
	ninja-build \
	python3

pushd '/usr/local'
git clone 'https://github.com/microsoft/verona' verona
pushd 'verona'
git checkout 'old_version' 2> /dev/null
git submodule update --depth 1 --init --recursive
# mkdir 'build_ninja'
# pushd 'build_ninja'
# cmake .. -DVERONA_LLVM_LOCATION=/usr/lib/llvm-19 -DVERONA_DOWNLOAD_LLVM=OFF -GNinja -DCMAKE_BUILD_TYPE=Release
# ninja
# popd; popd; popd
# ln -s /usr/local/verona/build_ninja/dist/veronac /usr/bin/veronac
