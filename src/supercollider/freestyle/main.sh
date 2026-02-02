#!/usr/bin/env bash

export QT_QPA_PLATFORM=offscreen
export QTWEBENGINE_DISABLE_SANDBOX=1
export XDG_RUNTIME_DIR=~

sclang program.scl > /dev/null 2>&1

stat output.wav
