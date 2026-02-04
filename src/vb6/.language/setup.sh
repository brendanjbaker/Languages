#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends cabextract

dpkg --add-architecture i386
apt-get update

apt-get install -y --no-install-recommends \
	wine \
	wine32:i386

export WINEPREFIX=$HOME/.wine32
export WINEARCH=win32
export WINEDEBUG=+loaddll,+reg,-all
export WINEDEBUG=+loaddll

wine reg add 'HKCU\Sofware\Wine' /v 'Version' /t 'REG_SZ' /d 'win2000' /f
wine reg query 'HKCU\Sofware\Wine' /v 'Version'

wineboot

winetricks -q vb6run
winetricks -q riched20
winetricks -q comctl32
winetricks -q oleaut32

wine vb6.exe
