#!/usr/bin/env bash

chuck --silent program.chuck 2>&1 \
| awk -F ' :' '{ print $1; }' \
| tr -d '"'

