ARG UBUNTU=rolling
FROM ubuntu:$UBUNTU
MAINTAINER Sebastian Braun <sebastian.braun@fh-aachen.de>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install --no-install-recommends -y -q \
    memcached \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

COPY core/memcached/memcached.conf /etc/memcached.conf

USER memcache
EXPOSE 11211
ENTRYPOINT ["memcached"]
