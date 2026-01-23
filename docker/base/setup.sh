#!/usr/bin/env bash

set -Eeuo pipefail

if [[ "${DEBUG_CONTAINER:-false}" == "true" ]]; then
	set -x
fi

export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get upgrade -y

# # Testing...
# apt-get install --no-install-recommends -y \
# 	bats \
# 	xxd

# Frequently needed (download-only).
apt-get install --download-only --no-install-recommends -y \
	apt-transport-https \
	autoconf \
	automake \
	binutils \
	bison \
	build-essential \
	ca-certificates \
	clang \
	cmake \
	curl \
	flex \
	gawk \
	gcc \
	git \
	gnupg \
	libclang-dev \
	libcurl4 \
	libcurl4-openssl-dev \
	libglu1-mesa-dev \
	libicu76 \
	libncurses-dev \
	libssl-dev \
	libtool \
	make \
	ninja-build \
	nodejs \
	npm \
	openjdk-21-jdk \
	python3 \
	sudo \
	unzip \
	vim \
	wget \
	xxd \
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
