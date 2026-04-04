#!/usr/bin/env bash

# The recommended way to install Pony is via PonyUp:
#
# https://github.com/ponylang/ponyup
#
# Version 0.15.1 of the "ponyup-init.sh" file is here:
#
# https://raw.githubusercontent.com/ponylang/ponyup/d16d27eb6cab9c458a4a4272dcbcd8cac8424d98/ponyup-init.sh
#
# However, it usually fails to successfully download the necessary file(s) from
# CloudSmith. Therefore, we will build from source.

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cmake \
	git \
	lld \
	python3 \
	zlib1g-dev

# When building LLVM using gcc, this error happens:
#
# >   [ 47%] Building CXX object llvm/src/llvm/lib/Analysis/CMakeFiles/LLVMAnalysis.dir/BlockFrequencyInfoImpl.cpp.o
# >   In file included from /opt/ponyc/0.62.1/lib/llvm/src/llvm/lib/Analysis/BlockFrequencyInfoImpl.cpp:14:
# >   /opt/ponyc/0.62.1/lib/llvm/src/llvm/include/llvm/ADT/APInt.h: In member function 'llvm::APInt& llvm::APInt::clearUnusedBits()':
# >   /opt/ponyc/0.62.1/lib/llvm/src/llvm/include/llvm/ADT/APInt.h:1989:37: internal compiler error: Illegal instruction
function llvm_build_fix {
	export CFLAGS="-march=x86-64"
	export CXXFLAGS="-march=x86-64"
}

LLVM_CONFIGURE_ARGS="\
-DLLVM_TARGETS_TO_BUILD=X86 \
-DLLVM_BUILD_TOOLS=OFF \
-DLLVM_BUILD_TESTS=OFF \
-DLLVM_BUILD_EXAMPLES=OFF"

mkdir '/opt/ponyc'
pushd '/opt/ponyc'
git clone 'https://github.com/ponylang/ponyc.git' '0.62.1'
pushd '0.62.1'
git checkout '49f73be6ed5c61735e65874a5991866828312114' 2> /dev/null
git submodule update --init --recursive --depth 1
llvm_build_fix
make -j1 libs LLVM_CONFIGURE_ARGS="$LLVM_CONFIGURE_ARGS"
make configure
make build
make install
popd; popd
