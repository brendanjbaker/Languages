#!/usr/bin/env bash

if [[ ! -f program ]]; then
	# TODO: This is generating a core dump. But it prints usage/help/version fine.
	mono /usr/local/nemerle/ncc.exe -out:program program.n
fi

./program "$@"
