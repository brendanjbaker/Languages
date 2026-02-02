#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	fizmo-console \
	inform6-library \
	inform6-compiler

ln -s '/usr/games/fizmo-console' '/usr/bin/fizmo'
