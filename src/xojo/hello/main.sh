#!/usr/bin/env bash

export DISPLAY=':99'

Xvfb "$DISPLAY" -screen 0 1024x768x24 &
xojo-ide &
xojo-ide-com build /app
