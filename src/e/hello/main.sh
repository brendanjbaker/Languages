#!/usr/bin/env bash

if [[ ! -f Program.jar ]]; then
	ecomp Program.e
fi

javaec Program "$@"
