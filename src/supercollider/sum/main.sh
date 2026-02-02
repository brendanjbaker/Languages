#!/usr/bin/env bash

export QT_QPA_PLATFORM=offscreen
export QTWEBENGINE_DISABLE_SANDBOX=1
export XDG_RUNTIME_DIR=~

sclang program.scl "$@" 2> /dev/null | \
grep '^#' | \
cut --delimiter='#' --fields=2
