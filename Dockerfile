FROM ruby:alpine
MAINTAINER caktux and Jean-Christophe Fillion-Robin "jchris.fillionr@kitware.com"

RUN apk add --no-cache build-base && \
    apk add --no-cache git && \
    apk add --no-cache sudo && \
    gem install travis && \
    apk del build-base

RUN mkdir /project

WORKDIR /project

ENV TRAVIS_CONFIG_PATH /travis

COPY imagefiles/entrypoint.sh /usr/share/

ENTRYPOINT ["/usr/share/entrypoint.sh", "travis"]

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG IMAGE
ARG VCS_REF
ARG VCS_URL
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name=$IMAGE \
      org.label-schema.description="Dockerized version of Travis Command Line Client." \
      org.label-schema.url="https://github.com/caktux/travis-cli" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.schema-version="1.0"
