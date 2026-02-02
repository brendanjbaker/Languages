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

sudo -u postgres \
	psql \
		--field-separator=',' \
  		--file=program.sql \
		--no-align \
		--tuples-only

sudo -u postgres \
	pg_ctl \
		-D "$PGDATA" \
		-l /tmp/postgres.log \
		stop > /dev/null
