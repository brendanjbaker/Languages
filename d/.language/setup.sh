#!/usr/bin/env bash

apt-get install -y wget

wget --quiet 'https://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list' -O '/etc/apt/sources.list.d/d-apt.list'
apt-get update --allow-insecure-repositories
apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring
apt-get update
apt-get install -y dmd-compiler dub
