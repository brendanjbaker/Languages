#!/usr/bin/env bash

if [[ ! -f output.ulx ]]; then
	inform program.inf > /dev/null
fi

fizmo program.z5 | grep -v '^$'
