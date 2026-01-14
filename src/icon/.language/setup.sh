#!/usr/bin/env bash

mkdir -p /usr/local/icon
pushd /usr/local/icon
wget --quiet 'https://github.com/gtownsend/icon/archive/refs/tags/v9.5.25a.tar.gz'
tar -xzf 'v9.5.25a.tar.gz'
rm 'v9.5.25a.tar.gz'
mv 'icon-9.5.25a' '9.5.25a'
pushd '9.5.25a'
make Configure name=linux
make
popd; popd
ln -s /usr/local/icon/9.5.25a/bin/icon /usr/bin/icon
ln -s /usr/local/icon/9.5.25a/bin/icont /usr/bin/icont
ln -s /usr/local/icon/9.5.25a/bin/iconx /usr/bin/iconx
