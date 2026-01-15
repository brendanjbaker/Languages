#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	apt-transport-https \
	wget

mkdir '/tmp/fsharp'
pushd '/tmp/fsharp'

download \
	--url 'https://packages.microsoft.com/config/debian/13/packages-microsoft-prod.deb' \
	--hash 'fbbb666a7efecdce77dbe60d4b1174a6c477d562'

dpkg -i 'packages-microsoft-prod.deb'
popd
rm -fr '/tmp/fsharp'

apt-get update
apt-get install -y --no-install-recommends dotnet-sdk-10.0

# Consume the "welcome to dotnet" message.
dotnet --help > /dev/null 2>&1

dotnet tool install dotnet-script
