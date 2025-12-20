FROM languages-base:latest

ENV DEBUG=false
ENV DEBUG_DOCKER=false
ENV DEBUG_PROGRAM=false
ENV DEBUG_SETUP=false
ENV TEST=false

WORKDIR /

COPY /.docker/system/entrypoint.sh .
