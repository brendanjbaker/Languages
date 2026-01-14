#!/usr/bin/env bash

set -Eeuo pipefail

export DEBIAN_FRONTEND="noninteractive"

declare download_url="https://github.com/c3lang/c3c/releases/download/v0.7.8/c3-linux.tar.gz"
declare opt_name="c3-0.7.8"

declare -a links=(
	"c3/c3c"
	)

mkdir -p "/opt/$opt_name"
wget --quiet "$download_url" -O download.tar.gz
tar xvf download.tar.gz -C "/opt/$opt_name"
rm download.tar.gz

for link in "${links[@]}"; do
	ln -s "/opt/$opt_name/$link" "/usr/bin/$(basename "$link")"
done
