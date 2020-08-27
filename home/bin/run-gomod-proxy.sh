#!/usr/bin/env bash

if docker inspect athens-proxy &>/dev/null; then
  echo "Stopping running proxy"
  docker stop athens-proxy
  docker rm athens-proxy
fi

docker run -d -v "athens:/var/lib/athens" \
   -e ATHENS_DISK_STORAGE_ROOT=/var/lib/athens \
   -e ATHENS_GO_BINARY_ENV_VARS='GOPROXY=proxy.golang.org,direct' \
   -e ATHENS_STORAGE_TYPE=disk \
   --name athens-proxy \
   -p 9009:3000 \
   --restart always \
   gomods/athens:latest
 docker logs -f athens-proxy
