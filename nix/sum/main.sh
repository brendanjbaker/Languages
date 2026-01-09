#!/usr/bin/env bash

export PATH="$PATH:/root/.nix-profile/bin"

nix-instantiate --eval program.nix "$@" 2> /dev/null | tr -d '"'
