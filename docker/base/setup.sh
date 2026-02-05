#!/usr/bin/env bash

set -Eeuo pipefail

if [[ "${DEBUG_CONTAINER:-false}" == "true" ]]; then
	set -x
fi

export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get upgrade -y

# # Testing...
apt-get install --no-install-recommends -y \
	bats \
	xxd

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
	libc6-dev \
	libclang-dev \
	libcurl4 \
	libcurl4-openssl-dev \
	libglu1-mesa-dev \
	libgpm2 \
	libicu76 \
	libncurses-dev \
	libsodium23 \
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
	vim-common \
	vim-runtime \
	wget \
	xxd \
	xz-utils

rm -fr /tmp/*
rm -fr /var/tmp/*
