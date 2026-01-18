#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	npm \
	nodejs

npm install --global @wenyanlang/cli
