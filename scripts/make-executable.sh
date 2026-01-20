#!/usr/bin/env bash

source library

find . -type f | grep -v 'cache' | grep '\.sh$' | env --basic xargs -n 100 chmod +x
find . -type f | grep -v 'cache' | grep '\.sh$' | env --basic xargs -n 100 git update-index --chmod=+x
