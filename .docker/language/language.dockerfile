FROM languages-system:latest

ARG LANGUAGE

WORKDIR /setup/language

COPY /.docker/language/setup/ .
COPY /${LANGUAGE}/.language/language.properties .
COPY /${LANGUAGE}/.language/setup.sh .
