FROM haskell:8.6.5

RUN apt-get update
RUN apt-get install -y wget curl git gcc

RUN mkdir -p /app/src
RUN git clone https://github.com/ff-notes/ron.git /app/src

WORKDIR "/app/src"
RUN git checkout demo
RUN stack setup

RUN stack build demo --dependencies-only
RUN stack build demo

COPY yandex-disk_latest_amd64.deb /app/
RUN dpkg -i /app/yandex-disk_latest_amd64.deb

COPY start.sh /app/
# for this to run one has to have ./credentials file near to this one
# with USER and PASSWORD variables set to some Yandex.Disk creds
COPY credentials /app/

WORKDIR "/app"

ENTRYPOINT "/app/start.sh"