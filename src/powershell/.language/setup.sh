#!/usr/bin/env bash

set -Eeuo pipefail

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	apt-transport-https \
	libicu76 \
	wget

download \
	--url 'https://github.com/PowerShell/PowerShell/releases/download/v7.5.4/powershell_7.5.4-1.deb_amd64.deb' \
	--hash '6ad18a6d8746c0435b8a2f18ecc12e3d7b50eb3e'

dpkg -i 'powershell_7.5.4-1.deb_amd64.deb' || true
rm 'powershell_7.5.4-1.deb_amd64.deb'
