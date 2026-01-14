#!/usr/bin/env bash

if [[ ! -f program ]]; then
	export CLUHOME="/opt/pclu/current"

	pclu -ext false -spec program -opt -cfiles -compile program > /dev/null
	plink -o program program.o
fi

./program "$@"
