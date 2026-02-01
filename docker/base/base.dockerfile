FROM debian:trixie-20260112-slim

WORKDIR /setup/base

COPY /docker/base/*.sh .
RUN /entrypoint.sh

CMD ["/usr/bin/bash"]
