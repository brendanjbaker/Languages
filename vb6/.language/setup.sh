#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install cabextract

dpkg --add-architecture i386
apt-get update
apt-get install -y wine wine32:i386

export WINEPREFIX=$HOME/.wine32
export WINEARCH=win32
export WINEDEBUG=+loaddll,+reg,-all
export WINEDEBUG=+loaddll

wine reg add 'HKCU\Sofware\Wine' /v Version /t REG_SZ /d win2000 /f
wine reg query 'HKCU\Sofware\Wine' /v Version

wineboot

winetricks vb6run   # Does this require accepting agreement via GUI?
winetricks riched20   # Does this require accepting agreement via GUI?
winetricks comctl32   # Requires accepting agreement in GUI.
winetricks oleaut32

wine vb6.exe
