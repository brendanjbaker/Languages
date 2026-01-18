#!/usr/bin/env bash

declare test_machine='meadowlark'

ssh "$test_machine" <<- EOF
	set -Eeuo pipefail
	sudo apt-get update
	sudo apt-get install -y --no-install-recommends git
	rm -fr '/tmp/languages'
	git clone 'https://github.com/brendanjbaker/Languages.git' '/tmp/languages'
	pushd '/tmp/languages'
	sudo ./languages.sh --configure
	bash -x languages.sh --debug --test run
	popd
	rm -fr '/tmp/languages'
	EOF
