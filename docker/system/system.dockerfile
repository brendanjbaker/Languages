FROM languages-base:latest

WORKDIR /

COPY /docker/system/*.sh .
RUN chmod +x entrypoint.sh
