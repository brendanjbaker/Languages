#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install --no-install-recommends -y \
	build-essential \
	ca-certificates \
	git \
	pip \
	unzip

pip install --break-system-packages \
	um80 \
	upeepz80 \
	uplm80

mkdir '/opt/runcpm'
pushd '/opt/runcpm'
git clone 'https://github.com/MockbaTheBorg/RunCPM.git' '6.9'
pushd '6.9'
git checkout '3362319c28634a5515a797c7799683f345fb82d0' 2> /dev/null
pushd 'RunCPM'
make posix build
popd; popd; popd
ln -s '/opt/runcpm/6.9/RunCPM/RunCPM' '/usr/bin/runcpm'
unzip -q '/opt/runcpm/6.9/DISK/A0.ZIP' -d '/opt/runcpm/6.9/RunCPM/DISK'
mkdir -p '/app'
ln -s '/opt/runcpm/6.9/RunCPM/DISK/A' '/app/A'
