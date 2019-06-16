FROM haskell:8.6.5

RUN apt-get update
RUN apt-get install -y curl git gcc

RUN mkdir -p /app/src
RUN git clone https://github.com/ff-notes/ron.git /app/src

WORKDIR "/app/src"
RUN git checkout demo
RUN stack setup

RUN stack build demo --dependencies-only
RUN stack build demo
RUN stack install --local-bin-path /app demo

WORKDIR "/app/src"

COPY build_update.sh /app/src

RUN chmod +x /app/src/build_update.sh

ENTRYPOINT "/app/src/build_update.sh"