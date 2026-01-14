#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends curl

curl -fsSL https://pixi.sh/install.sh | sh
ln -s /root/.pixi/bin/pixi /usr/bin/pixi
