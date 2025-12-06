#!/usr/bin/env bash

set -Eeuo pipefail

if [[ "${DEBUG_DOCKER:-false}" == "true" ]]; then
	set -x
fi

export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get upgrade -y

# Systemd...
apt-get install -y \
	systemd \
	systemd-sysv

# Snap...
apt-get install -y \
	fuse \
	snapd \
	squashfs-tools \
	squashfuse

# Frequently needed...
apt-get install -y \
	apt-transport-https \
	binutils \
	build-essential \
	curl \
	gawk \
	gcc \
	software-properties-common \
	unzip \
	wget \
	xz-utils

apt-get clean

rm -fr /etc/systemd/system/*.wants/*
rm -fr /lib/systemd/system/local-fs.target.wants/*
rm -fr /lib/systemd/system/multi-user.target.wants/*
rm -fr /lib/systemd/system/sockets.target.wants/*initctl*
rm -fr /lib/systemd/system/sockets.target.wants/*udev*
rm -fr /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup*
rm -fr /lib/systemd/system/systemd-update-utmp*
rm -fr /tmp/*
rm -fr /var/tmp/*

systemctl enable snapd
systemctl enable snapd.apparmor
