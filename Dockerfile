FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y wget curl git gcc

RUN curl -sSL https://get.haskellstack.org/ | sh

RUN mkdir -p /app/src
RUN git clone https://github.com/ff-notes/ron.git /app/src
RUN cd /app/src && git checkout demo
RUN cd /app/src && stack setup

RUN cd /app/src && stack build demo --dependencies-only
RUN cd /app/src && stack build demo

COPY yandex-disk_latest_amd64.deb /app/
RUN dpkg -i /app/yandex-disk_latest_amd64.deb

COPY start.sh /app/
# for this to run one has to have ./credentials file near to this one
# with USER and PASSWORD variables set to some Yandex.Disk creds
COPY credentials /app/

ENTRYPOINT "/app/start.sh"