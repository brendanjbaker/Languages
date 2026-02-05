#!/usr/bin/env bash

if [[ ! -f output.wav ]]; then
	csound program.csd > /dev/null 2>&1
fi

stat output.wav
