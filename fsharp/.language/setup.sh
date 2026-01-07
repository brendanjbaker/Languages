#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	apt-transport-https \
	wget

wget --quiet 'https://packages.microsoft.com/config/debian/13/packages-microsoft-prod.deb' -O 'packages-microsoft-prod.deb'

dpkg -i packages-microsoft-prod.deb

apt-get update
apt-get install -y --no-install-recommends dotnet-sdk-10.0

# Consume the "welcome to dotnet" message.
dotnet --help > /dev/null 2>&1

dotnet tool install dotnet-script
