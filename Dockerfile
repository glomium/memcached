# vim:set ft=dockerfile:
ARG BASEIMAGE=ubuntu:rolling
FROM $BASEIMAGE
MAINTAINER Sebastian Braun <sebastian.braun@fh-aachen.de>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

RUN apt-get update && apt-get install --no-install-recommends -y -q \
    memcached \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY memcached.conf /etc/memcached.conf

USER memcache
EXPOSE 11211
ENTRYPOINT ["memcached"]
