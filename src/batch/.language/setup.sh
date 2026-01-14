#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	wine \
	wine64

dpkg --add-architecture i386
apt-get update

apt-get install -y --no-install-recommends wine32:i386

wineboot -u
