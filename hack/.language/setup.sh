#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

wget -O- https://dl.hhvm.com/conf/hhvm.gpg.key | \
gpg --dearmor -o /etc/apt/keyrings/hhvm.gpg

tee "/etc/apt/sources.list.d/hhvm.list" <<- EOF
	deb [signed-by=/etc/apt/keyrings/hhvm.gpg] https://dl.hhvm.com/universal release main
	EOF

apt-get update
apt-get install -y --no-install-recommends hhvm
