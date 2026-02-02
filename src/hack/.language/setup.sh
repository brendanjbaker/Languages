#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	gnupg \
	wget

download \
	--url 'https://dl.hhvm.com/conf/hhvm.gpg.key' \
	--hash 'bf3f9b0ba87e07810e9c26ae3dfbf8fd23674ec4'

cat 'hhvm.gpg.key' | gpg --dearmor -o '/etc/apt/keyrings/hhvm.gpg'

tee "/etc/apt/sources.list.d/hhvm.list" <<- EOF
	deb [signed-by=/etc/apt/keyrings/hhvm.gpg] https://dl.hhvm.com/universal release main
	EOF

apt-get update
apt-get install -y --no-install-recommends hhvm
