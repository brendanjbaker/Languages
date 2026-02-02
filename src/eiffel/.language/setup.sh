#!/usr/bin/env bash

# Looks like it's fetching this URL:
# https://www.eiffel.com/cdn/EiffelStudio/25.12/98922/Eiffel_25.12_rev_98922-linux-x86-64.tar.bz2

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	bzip2 \
	ca-certificates \
	curl \
	libgtk-3-dev \
	libxtst-dev

export ISE_PLATFORM="linux-x86-64"

curl -sSL https://www.eiffel.org/setup/install.sh \
| bash -s -- --channel latest --install-dir /usr/local/eiffel

ln -s /usr/local/eiffel/studio/spec/linux-x86-64/bin/ec /usr/bin/ec
