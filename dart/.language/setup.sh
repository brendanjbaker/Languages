#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	apt-transport-https \
	gnupg \
	wget

wget -qO- 'https://dl-ssl.google.com/linux/linux_signing_key.pub' \
| gpg --dearmor \
| sudo tee /usr/share/keyrings/dart.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/dart.gpg] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main" \
| tee /etc/apt/sources.list.d/dart_stable.list

apt-get update
apt-get install -y --no-install-recommends dart
