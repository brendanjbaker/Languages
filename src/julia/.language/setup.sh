#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	curl

curl -fsSL https://install.julialang.org \
| sh -s -- --yes --default-channel '1.12.4' --path '/opt/julia/1.12.4'

ln -s '/opt/julia/1.12.4/bin/julia' '/usr/bin/julia'
ln -s '/opt/julia/1.12.4/bin/juliaup' '/usr/bin/juliaup'
