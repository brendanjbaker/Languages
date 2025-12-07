FROM debian:bookworm

ENV DEBUG=false
ENV DEBUG_DOCKER=false
ENV DEBUG_PROGRAM=false
ENV DEBUG_SETUP=false
ENV TEST=false

WORKDIR /

COPY /.docker/system/entrypoint.sh .

WORKDIR /setup/system

COPY /.docker/system/setup/ .
RUN /setup/system/setup-pre.sh

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]
