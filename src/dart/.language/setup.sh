#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	apt-transport-https \
	gnupg \
	wget

mkdir '/tmp/dart'
pushd '/tmp/dart'

download \
	--url 'https://dl-ssl.google.com/linux/linux_signing_key.pub' \
	--hash 'ed611b30fb48b4973ea643b81e60bd40b1b86369'

cat 'linux_signing_key.pub' | gpg --dearmor -o '/usr/share/keyrings/dart.gpg'
popd
rm -fr '/tmp/dart'

cat > '/etc/apt/sources.list.d/dart_stable.list' <<- EOF
	deb [signed-by=/usr/share/keyrings/dart.gpg] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main
	EOF

apt-get update
apt-get install -y --no-install-recommends dart
