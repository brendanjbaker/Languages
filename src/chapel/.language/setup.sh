#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends wget

declare filename='chapel-2.7.0-1.debian13.amd64.deb'
declare url="https://github.com/chapel-lang/chapel/releases/download/2.7.0/$filename"

pushd /tmp

wget \
	--output-document "$filename" \
	--quiet \
	"$url"

apt install -y --no-install-recommends "./$filename"

popd
