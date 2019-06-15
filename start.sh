#!/usr/bin/env bash

source credentials

yandex-disk token --password=$PASSWORD $USER
yandex-disk start --dir=/app/src/demo/data

echo "Greetings! Starting your CRDT Editor"

cd /app/src/ && stack exec demo