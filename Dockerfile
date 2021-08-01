FROM debian:buster-slim

MAINTAINER Deanen Perumal <deanenp@hotmail.com>

ENV DEBIAN_FRONTEND noninteractive

# install S6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.1/s6-overlay-amd64-installer /tmp/

RUN chmod +x /tmp/s6-overlay-amd64-installer && /tmp/s6-overlay-amd64-installer /
RUN apt-get update && apt-get upgrade \
  && mkdir -p   /config /data \
  && apt-get clean \
  && rm -rf /tmp/*

VOLUME /config /data

ENTRYPOINT ["/init"]
