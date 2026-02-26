#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	gnupg \
	wget

wget -q 'https://dl.hhvm.com/conf/hhvm.gpg.key'
printf '%s  %s\n' 'bf3f9b0ba87e07810e9c26ae3dfbf8fd23674ec4' 'hhvm.gpg.key' | sha1sum --check -
cat 'hhvm.gpg.key' | gpg --dearmor -o '/etc/apt/keyrings/hhvm.gpg'
echo "deb [signed-by=/etc/apt/keyrings/hhvm.gpg] https://dl.hhvm.com/universal release main" >> '/etc/apt/sources.list.d/hhvm.list'
apt-get update
apt-get install -y --no-install-recommends hhvm
