#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install --no-install-recommends -y \
	ca-certificates \
	wget \
	xz-utils

mkdir '/opt/zig'
mkdir '/tmp/zig'
pushd '/tmp/zig'
wget -q 'https://ziglang.org/download/0.16.0/zig-x86_64-linux-0.16.0.tar.xz'
printf '%s  %s\n' '2c835a9cc580a04856e953cb67aad231819ccbdb' 'zig-x86_64-linux-0.16.0.tar.xz' | sha1sum --check -
tar -xJf 'zig-x86_64-linux-0.16.0.tar.xz' -C '/opt/zig'
popd
rm -fr '/tmp/zig'
mv '/opt/zig/zig-x86_64-linux-0.16.0' '/opt/zig/0.16.0'
ln -s '/opt/zig/0.16.0/zig' '/usr/bin/zig'
