FROM debian:trixie

WORKDIR /setup/base

COPY /.docker/base/setup/ .
RUN /setup/base/setup-pre.sh

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]
