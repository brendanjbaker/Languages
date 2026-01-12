#!/usr/bin/env bash

export WINEDEBUG='-all'
export XDG_RUNTIME_DIR="/run/user/$EUID"

wine cmd /c program.bat 2>&1 \
| tr -d '\r' \
| grep -v '^[0-9a-f]\+:'
