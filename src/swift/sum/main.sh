#!/usr/bin/env bash

if [[ ! -f program ]]; then
	swiftc program.swift -o program
fi

./program "$@"
