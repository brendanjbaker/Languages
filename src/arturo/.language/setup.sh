#!/usr/bin/env bash

apt-get install -y --no-install-recommends \
	libwebkit2gtk-4.1-0 \
	unzip \
	wget

mkdir -p '/opt/arturo/0.9.84-beta'
pushd '/opt/arturo/0.9.84-beta'
wget --quiet 'https://github.com/arturo-lang/nightly/releases/download/2026-01-09/arturo-nightly.20260109-linux-amd64.zip'
unzip 'arturo-nightly.20260109-linux-amd64.zip'
rm 'arturo-nightly.20260109-linux-amd64.zip'
popd
ln -s '/opt/arturo/0.9.84-beta/arturo' '/usr/bin/arturo'
