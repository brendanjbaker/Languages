#!/usr/bin/env bash

if [[ ! -f program.class ]]; then
	groovyc -d . program.groovy
fi

groovy program "$@"
