#!/usr/bin/env bash

echo \
| sed -f program.sed \
| perl -pe 'chomp if eof'
