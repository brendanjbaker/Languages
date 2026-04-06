#!/usr/bin/env bash

export PUREBASIC_HOME='/opt/purebasic/3'

if [[ ! -f program ]]; then
	pbcompiler -o 'program' --console 'program.pb' > /dev/null
fi

./program "$@"
