#!/usr/bin/env bash

set -Eeuo pipefail

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	apt-transport-https \
	ca-certificates \
	libicu76 \
	wget

wget -q 'https://github.com/PowerShell/PowerShell/releases/download/v7.5.4/powershell_7.5.4-1.deb_amd64.deb'
printf '%s  %s\n' '6ad18a6d8746c0435b8a2f18ecc12e3d7b50eb3e' 'powershell_7.5.4-1.deb_amd64.deb' | sha1sum --check -
dpkg -i 'powershell_7.5.4-1.deb_amd64.deb' || true
rm 'powershell_7.5.4-1.deb_amd64.deb'
