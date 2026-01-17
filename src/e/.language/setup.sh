#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends default-jdk

mkdir '/opt/e'
pushd '/opt/e'

download \
	--url 'https://erights.org/download/0-9-3/E-purej-0.9.3d.tar.gz' \
	--hash 'f7ffe78cf89339c019a0bf6c349e5be25d42a2ce'

tar -xvf 'E-purej‑'*.tar.gz
mv 'E-purej-'* '0.9.3d'
popd

# ln -s '/opt/e/0.9.3d/bin/ecomp' '/usr/bin/ecomp'
# ln -s '/opt/e/0.9.3d/bin/javaec' '/usr/bin/javaec'
