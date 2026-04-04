#!/usr/bin/env bash

quackery 'program.qky' \
| perl -pe 'chomp if eof'
