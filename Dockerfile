FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbookworm

# set version label
#ARG BUILD_DATE
#ARG EMACS_VERSION
#ARG VERSION
#LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
#LABEL maintainer="tfree87"

# title
ENV TITLE=Emacs

RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install --no-install-recommends -y \
    emacs \
    git && \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000

VOLUME /config