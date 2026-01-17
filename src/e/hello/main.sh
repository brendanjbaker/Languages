#!/usr/bin/env bash

mkdir -p '/tmp/etrace'
rune Program.e "$@" 2>&1 | grep -v 'Xfuture option is deprecated'
