#!/usr/bin/env bash

grep -Fr './program' \
| grep -v '^scripts/' \
| grep -v '^src/elm/\.language/run\.js' \
| grep -v '@' \
|| true
