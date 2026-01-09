#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends erlang-base

pushd /tmp
wget --quiet 'https://github.com/gleam-lang/gleam/releases/download/v1.14.0/gleam-v1.14.0-x86_64-unknown-linux-musl.tar.gz'
tar -xzf 'gleam-v1.14.0-x86_64-unknown-linux-musl.tar.gz'
rm 'gleam-v1.14.0-x86_64-unknown-linux-musl.tar.gz'
mv gleam /usr/local/bin
popd
