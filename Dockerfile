FROM ubuntu:14.04

MAINTAINER @nerdnobs

ENV DEBIAN_FRONTEND="noninteractive" HOME="/root" TERM="xterm"
COPY sources.list /etc/apt/sources.list
RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y -o Dpkg::Options::="--force-confold" \
      wget \
      curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
