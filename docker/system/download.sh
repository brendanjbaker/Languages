#!/usr/bin/env bash

function download {
	local computed_hash
	local filename
	local option_hash=""
	local option_name=""
	local option_url=""

	function copy_file {
		cp "/cache/$filename" "$filename"
	}

	function get_filename {
		local filename

		if [[ -n "$option_name" ]]; then
			if [[ "$option_name" != "$(basename "$option_name")" ]]; then
				echo "Name \"$option_name\" cannot be a path."
				exit 1
			fi

			filename="$option_name"
		else
			local filename="$option_url"

			filename="${filename##*/}"
			filename="${filename%%[\?#]*}"
		fi

		echo -n "$filename"
	}

	function parse_arguments {
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
			echo "usage: download [--hash <SHA1>] [--name <NAME>] --url <URL>"
			exit 1
		elif [[ -z "$option_url" ]]; then
			echo "URL is required."
			exit 1
		fi

		filename=$(get_filename)
	}

	function print_computed_hash {
		echo "Computed hash of \"$filename\": $computed_hash" >&2
	}

	function retrieve_file {
		if [[ -f "/cache/$filename" ]]; then
			echo "Found \"$filename\" in cache."
		else
			echo "Downloading \"$filename\"..."

			if [[ ! -d "/cache" ]]; then
				echo "Warning: \"/cache\" directory does not exist." >&2
				mkdir -p "/cache"
			fi

			wget --no-check-certificate --quiet --output-document="/cache/$filename" "$option_url"
		fi
	}

	function verify_hash {
		computed_hash=$(sha1sum "/cache/$filename" | awk '{ print $1; }')

		if [[ -z "$option_hash" ]]; then
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

	parse_arguments "$@"
	retrieve_file
	verify_hash
	copy_file
}

download "$@"
