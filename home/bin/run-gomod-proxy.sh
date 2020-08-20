#!/usr/bin/env bash

if docker inspect athens-proxy &>/dev/null; then
  echo "Stopping running proxy"
  docker stop athens-proxy
  docker rm athens-proxy
fi

export ATHENS_STORAGE=$HOME/.cache/athens/storage
[[ -d $ATHENS_STORAGE ]] || mkdir -p "$ATHENS_STORAGE"
docker run -d -v "$ATHENS_STORAGE:/var/lib/athens" \
   -e ATHENS_DISK_STORAGE_ROOT=/var/lib/athens \
   -e ATHENS_STORAGE_TYPE=disk \
   --name athens-proxy \
   --restart always \
   -p 3330:3000 \
   gomods/athens:latest
 docker logs -f athens-proxy
