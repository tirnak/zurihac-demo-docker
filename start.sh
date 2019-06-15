#!/usr/bin/env bash

source credentials

yandex-disk token --password=$PASSWORD $USER
mkdir /data
yandex-disk start --dir=/data

echo 123

/usr/bin/env bash