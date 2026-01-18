#!/usr/bin/env bash

set -Eeuo pipefail

function install_podman {
	if which 'podman' > /dev/null 2>&1; then
		return
	fi

	if is_debian; then
		sudo apt-get install -y --no-install-recommends podman
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
	install_podman

	echo "Ready."
}

main
