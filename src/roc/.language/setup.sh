#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	binutils \
	ca-certificates \
	libc6-dev \
	wget

mkdir '/tmp/roc'
mkdir '/opt/roc'
pushd '/tmp/roc'

download \
	--url 'https://github.com/roc-lang/roc/releases/download/alpha4-rolling/roc-linux_x86_64-alpha4-rolling.tar.gz' \
	--hash 'bae71a1099fb1f7131d849d865b7cead3f91b3fa'

tar -xf 'roc-linux_x86_64-alpha4-rolling.tar.gz' -C '/opt/roc'
ln -s '/opt/roc/roc_nightly-linux_x86_64-2025-09-09-d73ea109/roc' '/usr/bin/roc'
cat > main.roc <<< 'app [main!] { pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.20.0/X73hGh05nNTkDHU06FHC0YfFaQB1pimX7gncRcao5mU.tar.br" }'
roc build || true
popd
rm -fr '/tmp/roc'
