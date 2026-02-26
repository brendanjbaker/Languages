#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	wget

mkdir -p '/opt/ink/1.9'
pushd '/opt/ink/1.9'
wget -q 'https://github.com/thesephist/ink/releases/download/v0.1.9/ink-linux'
printf '%s  %s\n' '62d23aa0a3125d954c73a7064fa4ed7b6e046025' 'ink-linux' | sha1sum --check -
popd
mkdir -p '/app'
mv 'std.ink' '/app'
mv 'str.ink' '/app'
chmod +x '/opt/ink/1.9/ink-linux'
ln -s '/opt/ink/1.9/ink-linux' '/usr/bin/ink'
