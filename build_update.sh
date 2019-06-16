#!/usr/bin/env bash

# script for updating demo app sources and rebuilding the executable
git pull
stack build demo
stack install --local-bin-path /app demo

# in the end copy executable to mounted folder (docker container must be spawned with -v $(pwd):/app/tmp )
cp /app/demo /app/tmp