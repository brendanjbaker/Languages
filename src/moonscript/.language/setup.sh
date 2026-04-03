#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	lua5.1 \
	luarocks

luarocks --lua-version=5.1 install moonscript 0.6.0-1
