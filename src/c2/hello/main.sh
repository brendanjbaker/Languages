#!/usr/bin/env bash

if [[ ! -f output/program/program ]]; then
	export C2_LIBDIR='/usr/lib/c2_libs'
	export C2_PLUGINDIR='/usr/lib/c2_plugins'

	c2c > /dev/null
fi

./output/program/program "$@"
