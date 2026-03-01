#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git

# Needed for 'make install'. Something is probably wrong in the Makefile.
function apply_patch {
	pushd '/opt/teascript/15d3960'
	mkdir -p 'etc'
	touch 'etc/tea.1'
	touch 'etc/tea.pc'
	popd
}

mkdir '/opt/teascript'
pushd '/opt/teascript'
git clone 'https://github.com/RevengerWizard/teascript.git' '15d3960'
pushd '15d3960'
git checkout '15d3960bc40706815ecefe0d9f96df9a8a4a6970' 2> /dev/null
apply_patch
make
make install
popd; popd
