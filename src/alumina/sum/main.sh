#!/usr/bin/env bash

if [[ ! -f program ]]; then
	alumina-boot --sysroot /opt/alumina/d98b9bd/sysroot program=program.alu -o program.c
	cc program.c -o program
fi

./program "$@"
