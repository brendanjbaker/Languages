#!/usr/bin/env bash

set -Eeuo pipefail

function ensure_root {
	if [[ "$EUID" -ne 0 ]]; then
		echo "Must be root."
		exit 1
	fi
}

function install_packages {
	if which 'podman' > /dev/null 2>&1; then
		return
	fi

	ensure_root

	if is_debian; then
		if ! grep '^13' /etc/debian_version > /dev/null; then
			echo "Only Debian 13 (Trixie) is supported."
			exit 1
		fi

		export DEBIAN_FRONTEND="noninteractive"

		apt-get update

		apt-get install -y --no-install-recommends \
			ca-certificates \
			git \
			podman

	elif is_msys; then
		winget install --scope machine "RedHat.Podman"
	else
		echo "Auto-configuration not supported for your system."
		exit 1
	fi
}

function is_debian {
	[[ -f /etc/debian_version ]]
}

function is_msys {
	[[ "$OSTYPE" == "msys" ]]
}

function main {
	install_packages

	echo "Ready."
}

main
