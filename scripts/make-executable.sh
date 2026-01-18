#!/usr/bin/env bash

find . -type f | grep -v 'cache' | grep '\.sh$' | xargs -n 100 chmod +x
find . -type f | grep -v 'cache' | grep '\.sh$' | xargs -n 100 git update-index --chmod=+x
