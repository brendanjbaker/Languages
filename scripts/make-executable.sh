#!/usr/bin/env bash

# shellcheck disable=SC1091
source library

declare -a executable_files=(
	languages.sh
	scripts/*.sh
	docker/system/entrypoint.sh)

for file in "${executable_files[@]}"; do
	chmod +x "$file"
	git update-index --chmod=+x "$file"
done
