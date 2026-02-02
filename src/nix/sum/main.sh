#!/usr/bin/env bash

nix-instantiate --eval program.nix "$@" 2> /dev/null | tr -d '"'
