#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends wget

wget --quiet 'https://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list' -O '/etc/apt/sources.list.d/d-apt.list'
apt-get update --allow-insecure-repositories
apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring
apt-get update

apt-get install -y --no-install-recommends \
	dmd-compiler \
	dub
