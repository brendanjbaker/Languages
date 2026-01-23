#!/usr/bin/env bash

export PGDATA=/etc/postgresql/17/main

sudo -u postgres \
	pg_ctl \
		-D "$PGDATA" \
		-o "-c listen_addresses='localhost'" \
		-l /tmp/postgres.log \
		start > /dev/null

sudo -u postgres \
	pg_ctl -D "$PGDATA" status > /dev/null

declare comma=","
declare input
declare output
declare output_status
declare output_text

if [[ $# -eq 0 ]]; then
	input="EMPTY"
elif [[ $# -eq 1 ]]; then
	input="$1"
else
	input="MULTI"
fi

output=$(
	sudo -u postgres \
		psql \
			--field-separator=',' \
			--file=program.sql \
			--set=input="$input" \
			--no-align \
			--tuples-only)

output_status=$(echo "$output" | cut --delimiter="$comma" --fields=1)
output_text=$(echo "$output" | cut --delimiter="$comma" --fields=2)

if [[ "$output_status" == "0" ]]; then
	echo "$output_text"
else
	exit "$output_status"
fi

sudo -u postgres \
	pg_ctl \
		-D "$PGDATA" \
		-l /tmp/postgres.log \
		stop > /dev/null
