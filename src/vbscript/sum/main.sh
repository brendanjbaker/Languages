#!/usr/bin/env bash

export XDG_RUNTIME_DIR=~
export WINEPREFIX=$HOME/.wine32
export WINEARCH=win32
export WINEDEBUG=-all

wine cscript.exe program.vbs | tr -d '\r'
