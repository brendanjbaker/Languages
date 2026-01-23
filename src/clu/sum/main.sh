#!/usr/bin/env bash

if [[ ! -f program ]]; then
	export CLUHOME="/opt/pclu/3.7"

	pclu -ext false -spec program -opt -cfiles -compile program > /dev/null
	plink -o program program.o
fi

./program "$@"
