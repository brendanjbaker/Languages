#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	erlang-base \
	wget

mkdir -p '/tmp/gleam'
pushd '/tmp/gleam'
wget -q 'https://github.com/gleam-lang/gleam/releases/download/v1.14.0/gleam-v1.14.0-x86_64-unknown-linux-musl.tar.gz'
printf '%s  %s\n' 'df41828b43a864d5eec55c544e14e072bdf4ca98' 'gleam-v1.14.0-x86_64-unknown-linux-musl.tar.gz' | sha1sum --check -
tar -xzf 'gleam-v1.14.0-x86_64-unknown-linux-musl.tar.gz'
rm 'gleam-v1.14.0-x86_64-unknown-linux-musl.tar.gz'
mv 'gleam' '/usr/local/bin'
popd
rm -fr '/tmp/gleam'
