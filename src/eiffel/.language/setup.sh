#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	bzip2 \
	ca-certificates \
	curl \
	libgtk-3-dev \
	libxtst-dev

export ISE_PLATFORM="linux-x86-64"

curl -sSL https://www.eiffel.org/setup/install.sh \
| bash -s -- --channel latest --install-dir /usr/local/eiffel

ln -s /usr/local/eiffel/studio/spec/linux-x86-64/bin/ec /usr/bin/ec
