FROM languages-system:latest

ARG LANGUAGE

WORKDIR /setup/language

COPY /src/${LANGUAGE}/.language/* .

RUN bash /entrypoint.sh
