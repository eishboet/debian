FROM debian:buster-slim

MAINTAINER Deanen Perumal <deanenp@hotmail.com>

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-amd64.tar.gz /
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /
COPY rootfs /

ENTRYPOINT ["/init"]
