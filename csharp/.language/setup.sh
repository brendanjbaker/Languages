#!/usr/bin/env bash

apt-get install -y \
	apt-transport-https \
	software-properties-common \
	wget

wget --quiet 'https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb' -O 'packages-microsoft-prod.deb'

dpkg -i packages-microsoft-prod.deb

apt-get update
apt-get install -y dotnet-sdk-10.0

dotnet --help > /dev/null 2>&1
