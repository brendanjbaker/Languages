#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install --no-install-recommends -y \
	ca-certificates \
	pip \
	python3

pip install --break-system-packages plankalkul
