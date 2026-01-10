#!/usr/bin/env bash

function download {
	local computed_hash
	local option_hash
	local option_name
	local option_url

	while [[ $# -ne 0 ]]; do
		if [[ $# -ge 2 && "$1" == "--name" ]]; then
			option_name="$2"
			shift; shift
		elif [[ $# -ge 2 && "$1" == "--hash" ]]; then
			option_hash="$2"
			shift; shift
		elif [[ $# -ge 2 && "$1" == "--url" ]]; then
			option_url="$2"
			shift; shift
		else
			break
		fi
	done

	if [[ $# -ne 0 ]]; then
		echo "usage: download --name <NAME> --url <URL> --hash <SHA-1-HASH>"
		exit 1
	fi

	wget --quiet --output-document="$option_name" "$option_url"

	computed_hash=$(sha1sum "$option_name")

	function print_computed_hash {
		echo "Computed hash of \"$option_name\": $computed_hash" >&2
	}

	if [[ "$option_hash" == '*' ]]; then
		print_computed_hash
		echo "Warning: Not verifying hash." >&2
	else
		if [[ "$computed_hash" == "$option_hash" ]]; then
			echo "Hash verified successfully." >&2
		else
			print_computed_hash
			echo "Hash verification failed." >&2
			exit 1
		fi
	fi
}
