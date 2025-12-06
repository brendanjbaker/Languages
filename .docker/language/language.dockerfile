FROM languages:latest

ARG LANGUAGE

WORKDIR /setup/language

COPY /.docker/language/setup/setup-pre.sh .
COPY /${LANGUAGE}/.language/language.properties .
COPY /${LANGUAGE}/.language/setup.sh .
