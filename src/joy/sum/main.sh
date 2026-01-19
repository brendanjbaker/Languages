#!/usr/bin/env bash

joy program.joy "$@" \
| grep -v ' is loaded$'
