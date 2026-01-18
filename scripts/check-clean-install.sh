#!/usr/bin/env bash

# First, on the host machine...

declare podman_socket

podman_socket=$(podman info --format '{{.Host.RemoteSocket.Path}}')
podman_socket=${podman_socket#unix://}

podman run \
	--interactive \
	--privileged \
	--tty \
	--volume "${podman_socket}:/run/podman/podman.sock" \
	debian:trixie bash

# Then, inside the container...

export DEBIAN_FRONTEND="noninteractive"

apt-get update

apt-get install -y --no-install-recommends \
	ca-certificates \
	git

git clone 'https://github.com/brendanjbaker/Languages.git' '/languages'
pushd '/languages'
bash -x languages.sh --configure
popd
