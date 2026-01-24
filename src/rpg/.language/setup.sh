#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install --no-install-recommends -y \
	ca-certificates \
	git \
	wget

mkdir '/tmp/netrpg'
pushd '/tmp/netrpg'

download \
	--url 'https://packages.microsoft.com/config/debian/13/packages-microsoft-prod.deb' \
	--hash 'fbbb666a7efecdce77dbe60d4b1174a6c477d562'

dpkg -i 'packages-microsoft-prod.deb'
popd
rm -fr '/tmp/netrpg'

apt-get update
apt-get install -y --no-install-recommends dotnet-sdk-10.0

# Consume the "welcome to dotnet" message.
dotnet --help > /dev/null 2>&1

function update_csproj_target_framework {
	search="netcoreapp3.1"
	replace="net10.0"
	sed --in-place "s/$search/$replace/g" /opt/netrpg/current/NetRPG/NetRPG.csproj
}

mkdir '/opt/netrpg'
pushd '/opt/netrpg'
git clone 'https://github.com/worksofliam/NetRPG.git' 'current'
pushd 'current'
git checkout '753a2cda6f128c71cbd41b6726228e51d042cfbd' 2> /dev/null
update_csproj_target_framework
dotnet build --configuration Release
popd; popd
