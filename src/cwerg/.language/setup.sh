#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	python3

export PYTHONPATH='/opt/cwerg/f834ff3'

mkdir '/opt/cwerg'
pushd '/opt/cwerg'
git clone 'https://github.com/robertmuth/Cwerg.git' 'f834ff3'
pushd 'f834ff3'
git checkout 'f834ff333456bc98ef53f40f3836e1bd2dfe56d8' 2> /dev/null
ln -s '/opt/cwerg/f834ff3/FE/compiler.py' '/usr/bin/cwerg-c'
ln -s '/opt/cwerg/f834ff3/BE/CodeGenX64/codegen.py' '/usr/bin/cwerg-gen'
