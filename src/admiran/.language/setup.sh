#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git

function update_configuration {
	# First, remove the line that starts with "admiranLibPath":
	# admiranLibPath = "../lib"
	sed -i '/^admiranLibPath/d' 'compiler/config.am'

	# Now, add back the line, but point at the actual "lib" directory:
	# admiranLibPath = "/opt/admiran/2.3/lib"
	echo 'admiranLibPath = "/opt/admiran/2.3/lib"' >> 'compiler/config.am'
}

mkdir '/opt/admiran'
pushd '/opt/admiran'
git clone 'https://github.com/taolson/Admiran.git' '2.3'
pushd '2.3'
git checkout 'c76afe5613c4f7175e54801a802941fcd3391bc3' 2> /dev/null
update_configuration
make
ln -s '/opt/admiran/2.3/bin/amc' '/usr/bin/amc'
