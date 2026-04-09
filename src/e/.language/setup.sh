#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	openjdk-21-jdk-headless \
	wget

mkdir '/tmp/e'
pushd '/tmp/e'
wget -q 'https://raw.githubusercontent.com/erights/erights-org-website/refs/heads/master/download/0-9-3/E-purej-0.9.3d.tar.gz'
printf '%s  %s\n' 'f7ffe78cf89339c019a0bf6c349e5be25d42a2ce' 'E-purej-0.9.3d.tar.gz' | sha1sum --check -
tar -xf 'E-purej-0.9.3d.tar.gz'
mkdir dist
shopt -s extglob
cp -r !(dist) dist/
bash 'inst-e.bash'
popd
rm -fr '/tmp/e'
ln -s '/usr/local/e/bin/rune' '/usr/bin/rune'
