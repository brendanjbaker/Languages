#!/usr/bin/env bash

systemctl enable --now postgresql > /dev/null 2>&1

sudo -u postgres \
	psql \
		--field-separator=',' \
		--file=program.sql \
		--no-align \
		--tuples-only
