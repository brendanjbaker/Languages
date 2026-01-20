#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends rustup

rustup install 1.92.0
rustup default 1.92.0
