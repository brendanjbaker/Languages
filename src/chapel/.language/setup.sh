#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends wget

declare filename='chapel-2.7.0-1.debian13.amd64.deb'

mkdir '/tmp/chapel'
pushd '/tmp/chapel'

download \
	--url "https://github.com/chapel-lang/chapel/releases/download/2.7.0/$filename" \
	--hash '61e773d7d6184b5d9c1c0194ec11d89e2d81e4e0'

apt install -y --no-install-recommends "./$filename"
popd
rm -fr '/tmp/chapel'
