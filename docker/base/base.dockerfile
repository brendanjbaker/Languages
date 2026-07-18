FROM debian:trixie-20260623-slim

WORKDIR /setup/base

COPY /docker/base/*.sh .
RUN bash /setup/base/setup.sh

CMD ["/usr/bin/bash"]
