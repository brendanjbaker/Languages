#!/usr/bin/env bash

declare test_machine='pi'

ssh "$test_machine" <<- EOF
	set -Eeuo pipefail
	sudo apt-get update
	sudo apt-get install -y --no-install-recommends git uidmap
	rm -fr ~/.config/containers
	rm -fr ~/.local/share/containers
	rm -fr ~/.local/share/containers

	sudo tee /etc/containers/storage.conf > /dev/null <<- EOF2
		[storage]
		driver = "vfs"
		EOF2

	podman system reset --force
	rm -fr '/tmp/languages'
	git clone 'https://github.com/brendanjbaker/Languages.git' '/tmp/languages'
	pushd '/tmp/languages'
	sudo ./languages.sh --configure
	bash -x languages.sh --debug --test run
	popd
	rm -fr '/tmp/languages'
	EOF
