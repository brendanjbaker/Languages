#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install --no-install-recommends -y \
	build-essential \
	ca-certificates \
	cmake \
	git \
	lld \
	ninja-build \
	python3 \
	wget \
	xz-utils

ln -s "$(which python3)" '/usr/bin/python'

mkdir '/opt/zig'
mkdir '/tmp/zig'
pushd '/tmp/zig'
wget -q 'https://ziglang.org/download/0.15.2/zig-x86_64-linux-0.15.2.tar.xz'
printf '%s  %s\n' 'd7f45fa22a1be6d55b59aefbdbd25c57b364c9a8' 'zig-x86_64-linux-0.15.2.tar.xz' | sha1sum --check -
tar -xJf 'zig-x86_64-linux-0.15.2.tar.xz' -C '/opt/zig'
popd
rm -fr '/tmp/zig'
mv '/opt/zig/zig-x86_64-linux-0.15.2' '/opt/zig/0.15.2'
ln -s '/opt/zig/0.15.2/zig' '/usr/bin/zig'

mkdir -p '/opt/flint/0.3.3'
mkdir '/tmp/flint'
pushd '/tmp/flint'
git clone 'https://github.com/flint-lang/flintc.git' '0.3.3'
pushd '0.3.3'
git checkout 'd628e08428ff5d2c117c6b5e85e5059b1221bf81' 2> /dev/null
zig build -Djobs="$(nproc)"
mv 'zig-out/bin/flintc-debug' '/opt/flint/0.3.3/'
popd; popd
rm -fr '/tmp/flint'
ln -s '/opt/flint/0.3.3/flintc-debug' '/usr/bin/flintc'
