#!/usr/bin/env bash

set -Eeuo pipefail

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	apt-transport-https \
	libicu76 \
	wget

wget --quiet 'https://github.com/PowerShell/PowerShell/releases/download/v7.5.4/powershell_7.5.4-1.deb_amd64.deb' -O 'powershell.deb'

dpkg -i 'powershell.deb' || true

rm 'powershell.deb'
