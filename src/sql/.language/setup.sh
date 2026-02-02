#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	postgresql \
	postgresql-client \
	sudo

ln -s '/usr/lib/postgresql/17/bin/pg_ctl' '/usr/bin/pg_ctl'
