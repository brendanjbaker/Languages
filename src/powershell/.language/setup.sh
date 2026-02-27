#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	ca-certificates \
	wget

mkdir '/tmp/powershell'
pushd '/tmp/powershell'
wget -q 'https://github.com/PowerShell/PowerShell/releases/download/v7.6.0-rc.1/powershell-preview_7.6.0-rc.1-1.deb_amd64.deb'
printf '%s  %s\n' 'de3e264276db102e6d4b4c4d9a06684f0f4bd833' 'powershell-preview_7.6.0-rc.1-1.deb_amd64.deb' | sha1sum --check -
apt-get install -y --no-install-recommends './powershell-preview_7.6.0-rc.1-1.deb_amd64.deb'
popd
rm -fr '/tmp/powershell'
ln -s '/usr/bin/pwsh-preview' '/usr/bin/pwsh'
