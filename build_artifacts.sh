#!/usr/bin/env bash

rm -f ./demo || true
# should git pull, stack build, stack install demo
# and copy "demo" binary executable in this dir
docker run --rm -v $(pwd):/app/tmp crdt-editor:build

# rebuild latest crdt-editor with new ./demo executable
docker build -f run.Dockerfile -t crdt-editor .

# push it to Docker Hub
docker login

docker tag crdt-editor tirnak/crdt-editor

docker push tirnak/crdt-editor