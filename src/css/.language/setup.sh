#!/usr/bin/env bash

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
	fonts-liberation \
	libasound2 \
	libatk-bridge2.0-0 \
	libatk1.0-0 \
	libcairo2 \
	libcups2 \
	libdrm2 \
	libgbm1 \
	libglib2.0-0 \
	libnspr4 \
	libnss3 \
	libnss3 \
	libpango-1.0-0 \
	libx11-xcb1 \
	libxcb1 \
	libxcomposite1 \
	libxdamage1 \
	libxfixes3 \
	libxkbcommon0 \
	libxrandr2 \
	libxrender1 \
	npm

mkdir '/app'
pushd '/app'
npm install puppeteer@24.35.0
popd
