#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	sudo \
	wget \
	xz-utils

mkdir '/opt/nix'
mkdir '/tmp/nix'
pushd '/tmp/nix'
download --url 'https://releases.nixos.org/nix/nix-2.33.1/nix-2.33.1-x86_64-linux.tar.xz'
tar -xJf 'nix-2.33.1-x86_64-linux.tar.xz' -C '/opt/nix'
popd
rm -fr '/tmp/nix'
mv '/opt/nix/nix-2.33.1-x86_64-linux' '/opt/nix/2.33.1'
useradd -m -s /bin/bash app
usermod -aG sudo app
echo 'app ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/app
chmod 0440 /etc/sudoers.d/app

sudo -u app bash <<- EOF
	set -x
	export NIX_CONFIG="sandbox = false"
	bash /opt/nix/2.33.1/install --no-daemon --yes
	EOF

ln -s '/opt/nix/2.33.1/store/j6k7vmkpcm26d6m78nfpcrswxlfgdn9q-nix-2.33.1/bin/nix-instantiate' '/usr/bin/nix-instantiate'
groupadd nixbld
