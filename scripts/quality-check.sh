#!/usr/bin/env bash

set -Eeuo pipefail

# shellcheck disable=SC1091
source library

declare script_directory
declare root_directory
declare -a scripts

script_directory=$(program::get_script_directory)
root_directory=$(readlink --canonicalize "$script_directory/..")

scripts=(
	"scripts/find-apt-install-with-recommends.sh"
	"scripts/find-missing-argument-passing.sh"
	"scripts/find-space-indentation.sh"
	"scripts/generate-library.sh"
	"scripts/make-executable.sh")

directory::push "$root_directory"

for script in "${scripts[@]}"; do
	echo "${script}:"
	echo
	(bash "$script" 2>&1 && echo "Done.") | indent
	echo
done

directory::pop

echo "Done."
