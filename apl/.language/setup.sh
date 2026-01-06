#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y build-essential libncurses-dev
mkdir -p /usr/local/apl
pushd /usr/local/apl
wget https://ftp.gnu.org/gnu/apl/apl-1.9.tar.gz
tar -xzf apl-1.9.tar.gz
mv apl-1.9 1.9
cd 1.9
./configure
make
make install
