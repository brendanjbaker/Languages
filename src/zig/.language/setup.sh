#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install --no-install-recommends -y \
	wget \
	xz-utils

mkdir '/opt/zig'
mkdir '/tmp/zig'
pushd '/tmp/zig'

download \
	--url 'https://ziglang.org/download/0.15.2/zig-x86_64-linux-0.15.2.tar.xz' \
	--hash 'd7f45fa22a1be6d55b59aefbdbd25c57b364c9a8'

tar -xJf 'zig-x86_64-linux-0.15.2.tar.xz' -C '/opt/zig'
popd
rm -fr '/tmp/zig'
mv '/opt/zig/zig-x86_64-linux-0.15.2' '/opt/zig/0.15.2'
ln -s '/opt/zig/0.15.2/zig' '/usr/bin/zig'
