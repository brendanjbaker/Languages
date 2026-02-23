#!/usr/bin/env bash

flowmatic program.flowmatic \
| grep -i 'message' \
| awk -F ': ' '{ print $2; }'
