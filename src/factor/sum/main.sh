#!/usr/bin/env bash

if true; then
	factor program/program.factor 2> /dev/null
else
	declare factor_home="/opt/factor/0.101"

	if [[ ! -f "$factor_home/program/program.out" ]]; then
		factor <<- EOF
			USING: namespaces vocabs.loader sequences tools.deploy ;
			"/app" vocab-roots get push
			"program" deploy
			EOF

		mv "$factor_home/program/program.out" "/app/program/program"
	fi

	./program/program "$@"
fi
