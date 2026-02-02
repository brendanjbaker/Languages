#!/usr/bin/env bash

###
# Build from source:
#
# git clone --depth 1 --branch 0.60.4 https://github.com/ponylang/ponyc.git
# cd ponyc
# make libs
# make configure
# make build
# make install
#

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	clang \
	curl

export SHELL=/usr/bin/bash

sh -cx "$(curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/ponylang/ponyup/latest-release/ponyup-init.sh)" || true

export PATH="/root/.local/share/ponyup/bin:$PATH"

ponyup default x86_64-linux-ubuntu24.04
ponyup update ponyc release-0.60.4
