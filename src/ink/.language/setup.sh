#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends wget

mkdir -p '/opt/ink/1.9'
pushd '/opt/ink/1.9'

download \
	--url 'https://github.com/thesephist/ink/releases/download/v0.1.9/ink-linux' \
	--hash '62d23aa0a3125d954c73a7064fa4ed7b6e046025'

popd

mkdir -p '/app'
mv 'std.ink' '/app'
mv 'str.ink' '/app'

ln -s '/opt/ink/1.9/ink-linux' '/usr/bin/ink'
