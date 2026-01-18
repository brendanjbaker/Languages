#!/usr/bin/env bash

cp 'program.cfm' "/opt/coldfusion/2025/cfusion/wwwroot/"

curl \
	--retry 60 \
	--retry-all-errors \
	--retry-delay 1 \
	--silent \
	'http://localhost:8500/program.cfm' \
	2> /dev/null
