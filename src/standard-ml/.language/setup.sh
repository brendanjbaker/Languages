#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

cat > '/etc/apt/sources.list.d/debian-sid.list' <<- EOF
	deb http://deb.debian.org/debian sid main
	EOF

apt-get update
apt-get install --no-install-recommends -y smlnj
