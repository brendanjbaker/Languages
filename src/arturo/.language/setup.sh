#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	libmpfr6 \
	libwebkit2gtk-4.1-0 \
	unzip \
	wget

mkdir -p '/opt/arturo/0.9.84-beta'
pushd '/opt/arturo/0.9.84-beta'
wget -q 'https://github.com/arturo-lang/nightly/releases/download/2026-01-09/arturo-nightly.20260109-linux-amd64.zip'
printf '%s  %s\n' '43bd671bb39c785a471ad0c10cc6128d88073d18' 'arturo-nightly.20260109-linux-amd64.zip' | sha1sum --check -
unzip 'arturo-nightly.20260109-linux-amd64.zip'
rm 'arturo-nightly.20260109-linux-amd64.zip'
popd
ln -s '/opt/arturo/0.9.84-beta/arturo' '/usr/bin/arturo'
