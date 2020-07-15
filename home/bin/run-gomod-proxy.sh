#!/usr/bin/env bash

export ATHENS_STORAGE=$HOME/.cache/athens/storage
[[ -d $ATHENS_STORAGE ]] || mkdir -p "$ATHENS_STORAGE"
docker run -d -v "$ATHENS_STORAGE:/var/lib/athens" \
   -e ATHENS_DISK_STORAGE_ROOT=/var/lib/athens \
   -e ATHENS_STORAGE_TYPE=disk \
   --name athens-proxy \
   --restart always \
   -p 3330:3000 \
   gomods/athens:latest
