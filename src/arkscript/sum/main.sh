#!/usr/bin/env bash

arkscript --compile 'program.ark' --lib '/usr/local/lib/Ark'
arkscript '__arkscript__/program.arkc' "$@"
