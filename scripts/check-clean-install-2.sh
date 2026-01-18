#!/usr/bin/env bash

declare test_machine='pi'

ssh "$test_machine" <<- EOF
	set -Eeuo pipefail
	apt-get update
	apt-get install -y --no-install-recommends git
	git clone 'https://github.com/brendanjbaker/Languages.git' '/languages'
	pushd '/languages'
	./languages.sh --configure
	./languages.sh --test run
	popd
	EOF
