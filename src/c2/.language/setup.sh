#!/usr/bin/env bash

set -Eeuo pipefail

mkdir -p '/opt/c2'
pushd '/opt/c2'
git clone 'https://github.com/c2lang/c2compiler.git' '7b17e77'
pushd '7b17e77'
git checkout '7b17e77'
git submodule update --init --recursive --depth 1
source env.sh
make
ln -s '/opt/c2/7b17e77/output/c2c/c2c' '/usr/bin/c2c'
ln -s '/opt/c2/7b17e77/output/c2tags/c2tags' '/usr/bin/c2tags'
ln -s '/opt/c2/7b17e77/libs' '/usr/lib/c2_libs'
ln -s '/opt/c2/7b17e77/output/plugins' '/usr/lib/c2_plugins'
popd; popd
