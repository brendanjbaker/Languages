#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	wget

mkdir '/tmp/chapel'
pushd '/tmp/chapel'
wget -q 'https://github.com/chapel-lang/chapel/releases/download/2.7.0/chapel-2.7.0-1.debian13.amd64.deb'
printf '%s  %s\n' '61e773d7d6184b5d9c1c0194ec11d89e2d81e4e0' 'chapel-2.7.0-1.debian13.amd64.deb' | sha1sum --check -
apt install -y --no-install-recommends 'chapel-2.7.0-1.debian13.amd64.deb'
popd
rm -fr '/tmp/chapel'
