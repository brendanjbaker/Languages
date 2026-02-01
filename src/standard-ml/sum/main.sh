#!/usr/bin/env bash

export CM_VERBOSE='false'

sml program.sml < /dev/null \
| grep -v '^\- $' \
| tail -n 1
