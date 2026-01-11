#!/usr/bin/env bash

# This script exports a subset of my personal Bash library into a "sub-library"
# that is suitable for running the languages.sh runner.
#
# This is a band-aid until I refine my entire Bash library for general publication.
#

set -Eeuo pipefail

if [[ "$(pwd)" != "/d/Code/Languages" ]]; then
	echo "Must run this from /d/Code/Languages." >&2
	exit 1
fi

source library

declare output_path='.lib/library.bash'

mkdir -p '.lib'
rm -f "$output_path"
echo 'set -Eeuo pipefail' >> "$output_path"
echo >> "$output_path"

declare -p \
	cache_directory \
	hash_program \
	$(compgen -v COLOR_) \
	$(compgen -v INT_) \
	$(compgen -v INTEGER_) \
	$(compgen -v KERNEL_TYPE_) \
	$(compgen -v PATTERN_) \
	$(compgen -v S_INT_) \
	$(compgen -v STATUS_) \
	$(compgen -v TERMINAL_) \
	$(compgen -v UNDERLINE_) \
	>> "$output_path"

declare -f \
	assert::integer \
	assert::integer_range \
	cache::get_path \
	cache::set \
	cache::try_get \
	directory::current \
	directory::does_not_exist \
	directory::exists \
	directory::hash \
	directory::list_subdirectories \
	docker::image_exists \
	docker::is_started \
	docker::start \
	env \
	error \
	error::error \
	error::usage \
	integer::is_integer \
	path::convert \
	platform::get_kernel_type \
	platform::is_container \
	platform::is_windows \
	platform::is_windows_or_wsl \
	platform::is_wsl \
	program::get_script_directory \
	program::get_script_path \
	status::temporary \
	stdin::is_not_piped \
	stdin::is_piped \
	stdout::is_interactive \
	string::hash \
	string::to_hex \
	string::to_lower \
	string::to_lowercase \
	>> "$output_path"
