#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	cabextract \
	wine \
	wine64

dpkg --add-architecture i386
apt-get update

apt-get install -y --no-install-recommends wine32:i386

export XDG_RUNTIME_DIR=~
export WINEPREFIX=$HOME/.wine32
export WINEARCH=win32
export WINEDEBUG=-all

wine reg add 'HKCU\Sofware\Wine' /v 'Version' /t 'REG_SZ' /d 'win7' /f

wineboot -u

cat > /etc/apt/sources.list.d/debian.sources <<- EOF
	Types: deb
	# http://snapshot.debian.org/archive/debian/20251229T000000Z
	URIs: http://deb.debian.org/debian
	Suites: trixie trixie-updates
	Components: main contrib
	Signed-By: /usr/share/keyrings/debian-archive-keyring.pgp

	Types: deb
	# http://snapshot.debian.org/archive/debian-security/20251229T000000Z
	URIs: http://deb.debian.org/debian-security
	Suites: trixie-security
	Components: main
	Signed-By: /usr/share/keyrings/debian-archive-keyring.pgp
	EOF

apt-get update
apt-get install -y --no-install-recommends winetricks

winetricks -q wsh57
