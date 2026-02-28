#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	clang \
	wget

mkdir '/opt/odin'
pushd '/opt/odin'
wget -q 'https://github.com/odin-lang/Odin/releases/download/dev-2026-02/odin-linux-amd64-dev-2026-02.tar.gz'
tar -xvf 'odin-linux-amd64-dev-2026-02.tar.gz'
mv 'odin-linux-amd64-nightly+2026-02-04' 'dev-2026-02'
popd
ln -s '/opt/odin/dev-2026-02/odin' '/usr/bin/odin'
