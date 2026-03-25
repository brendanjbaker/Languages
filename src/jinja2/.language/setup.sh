#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install --no-install-recommends -y \
	ca-certificates \
	pip \
	python3

pip install --break-system-packages jinja2-cli==1.0.0
