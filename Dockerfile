FROM ubuntu:18.04

COPY start.sh /app/

ENTRYPOINT "/app/start.sh"