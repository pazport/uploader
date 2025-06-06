#FROM ghcr.io/linuxserver/baseimage-alpine:latest
FROM lsiobase/alpine:3.12

RUN \
  echo "**** install build packages ****" && \
  apk --quiet --no-cache --no-progress add shadow bash curl bc findutils coreutils && \
  rm -rf /var/cache/apk/*

VOLUME [ "/config" ]

COPY root/ /

EXPOSE 8080

HEALTHCHECK --timeout=5s --start-period=30s --interval=15s CMD curl --silent --fail localhost:8080

ENTRYPOINT [ "/init" ]