#!/usr/bin/env bash

if [[ ! -f program ]]; then
	go build program.go
fi

./program "$@"
