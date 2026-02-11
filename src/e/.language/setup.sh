#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	openjdk-21-jdk-headless \
	wget

mkdir '/tmp/e'
pushd '/tmp/e'

download \
	--url 'https://erights.org/download/0-9-3/E-purej-0.9.3d.tar.gz' \
	--hash 'f7ffe78cf89339c019a0bf6c349e5be25d42a2ce'

tar -xvf 'E-purej-0.9.3d.tar.gz'
mkdir dist
shopt -s extglob
cp -r !(dist) dist/
bash inst-e.bash
popd
rm -fr '/tmp/e'
ln -s '/usr/local/e/bin/rune' '/usr/bin/rune'
