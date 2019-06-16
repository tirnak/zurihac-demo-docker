# Dockerfile for building rather small image that would run on users' machines
# Prerequisites:
# 1. Container from build.Dockerfile has built and copied "demo" executable to current folder
# 2. There is a ./credentials file, containing USER and PASSWORD variables set to some Yandex.Disk creds

FROM bitnami/minideb:jessie

RUN apt-get update
RUN apt-get install -y libgmp10

RUN mkdir -p /app
WORKDIR "/app"

COPY yandex-disk_latest_amd64.deb /app/
RUN dpkg -i /app/yandex-disk_latest_amd64.deb

COPY start.sh /app/
COPY data /app/demo/data

COPY credentials /app/

# Next line disables docker build cache so, that
# current version of "demo" is pulled in
ARG CACHEBUST=1
COPY demo /app/editor

ENTRYPOINT "/app/start.sh"