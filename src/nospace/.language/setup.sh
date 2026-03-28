#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install --no-install-recommends -y npm

npm install --global nospace@0.0.1
