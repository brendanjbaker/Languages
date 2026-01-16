#!/usr/bin/env bash

lessc program.less | awk -F '"' '{ print $2; }'
