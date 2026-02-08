#!/usr/bin/env bash

declare elk_home='/opt/elk/fa2c531'
declare elk="$elk_home/cmd/elk/main.go"

# Compiling doesn't seem to work, yet, but running/interpreting does.
go -C "$elk_home" run "$elk" run '/app/program.elk' "$@"
