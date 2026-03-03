#!/usr/bin/env bash

# Hylo depends on...
#
# - LLVM 20+
# - Swift 6.2+
#
# These are newer versions that aren't available in Trixie's package repositories. Therefore, we'll
# have to install them manually.

shopt -s dotglob extglob

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cmake \
	git \
	libcurl4-openssl-dev \
	libedit-dev \
	libzstd-dev \
	ninja-build \
	wget \
	zlib1g-dev

mkdir '/tmp/swift'
pushd '/tmp/swift'
wget -q 'https://download.swift.org/swift-6.2.4-release/debian12/swift-6.2.4-RELEASE/swift-6.2.4-RELEASE-debian12.tar.gz'
printf '%s  %s\n' 'c79819efa74850bdafbd89770d21bb8ae424a3d3' 'swift-6.2.4-RELEASE-debian12.tar.gz' | sha1sum --check -
tar -xzf 'swift-6.2.4-RELEASE-debian12.tar.gz' -C '/' --strip-components=1
popd
rm -fr '/tmp/swift'

mkdir '/tmp/llvm'
pushd '/tmp/llvm'
wget -q 'https://apt.llvm.org/llvm-snapshot.gpg.key'
printf '%s  %s\n' '8fbf973ae33016a37ee79a1173a6db9390b85a04' 'llvm-snapshot.gpg.key' | sha1sum --check -
mv 'llvm-snapshot.gpg.key' '/etc/apt/trusted.gpg.d/apt.llvm.org.asc'
popd
rm -fr '/tmp/llvm'
echo 'deb http://apt.llvm.org/trixie/ llvm-toolchain-trixie-20 main' >> '/etc/apt/sources.list.d/llvm.list'
apt-get update

apt-get install -y --no-install-recommends \
	clang-20 \
	lld-20 \
	llvm-20 \
	llvm-20-dev

mkdir '/opt/hylo'
pushd '/opt/hylo'
git clone 'https://github.com/hylo-lang/hylo.git' 'b9d5795'
pushd 'b9d5795'
git checkout 'b9d5795437a3aa0a8495fbc53145dc791d21dda4' 2> /dev/null
git submodule update --init

cmake \
	-D LLVM_DIR='/usr/lib/llvm-20/lib/cmake/llvm' \
	-D CMAKE_BUILD_TYPE='Release' \
	-D BUILD_TESTING=0 \
	-G 'Ninja' \
	-S '.' \
	-B '.build'

cmake --build '.build' --parallel "$(nproc)"
rm -rf -- !(.build|StandardLibrary)
popd; popd
ln -s '/opt/hylo/b9d5795/.build/Sources/hc' '/usr/bin/hc'
