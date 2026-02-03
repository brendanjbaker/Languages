#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	winbind \
	wine64 \
	winetricks

export WINEPREFIX=$HOME/.wine-masm
export WINEARCH=win64

wineboot

winetricks -q vcrun2019
winetricks -q windows-sdk-10

wget https://aka.ms/vs/17/release/vs_BuildTools.exe
wine vs_BuildTools.exe
# TODO
