#!/usr/bin/env bash

rye 'program.rye' "$@" 2>&1 \
| ansifilter \
| grep -v '^Security policy loaded'
