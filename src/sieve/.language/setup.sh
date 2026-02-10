#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	dovecot-core \
	dovecot-sieve

mkdir -p '/app'
useradd -m -s /bin/bash app

cat >> '/etc/dovecot/conf.d/10-mail.conf' <<- EOF
	mail_uid = 1000
	mail_gid = 1000
	EOF
