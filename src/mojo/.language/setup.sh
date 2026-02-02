#!/usr/bin/env bash

# The "install.sh" script downloads this file:
# https://github.com/prefix-dev/pixi/releases/download/v0.63.2/pixi-x86_64-unknown-linux-musl.tar.gz

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	curl

curl -fsSL https://pixi.sh/install.sh | sh
ln -s /root/.pixi/bin/pixi /usr/bin/pixi
