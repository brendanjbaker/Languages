#!/usr/bin/env bash

if [[ ! -f Elixir.Program.beam ]]; then
	elixirc program.ex
fi

elixir -e Program.main "$@"
