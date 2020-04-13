FROM debian:buster-slim

MAINTAINER Deanen Perumal <deanenp@hotmail.com>

# install S6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-amd64.tar.gz /tmp/
RUN apt-get update \
  && echo "*** Installing S6 Overlay ***" \
  && tar xzf /tmp/s6-overlay-amd64.tar.gz -C / \
  && echo "*** Create abc user and then the config & data directories ***" \
  && groupmod -g 1000 users \
  && useradd -u 911 -U -d /config -s /bin/false abc \
  && usermod -G users abc \
  && mkdir -p   /config/custom-cont-init.d \
                /data \
                /default \
  && apt-get clean \
  && rm -rf /tmp/*

COPY rootfs/ /

RUN chmod 755 /etc/s6/init/*

ENTRYPOINT ["/init"]
