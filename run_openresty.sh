#!/bin/bash

podman run -it --name lua --rm \
  --volume $PWD/nginx:/usr/local/openresty/nginx/conf/ \
  -v $PWD/lua:/opt/lua \
  -p 8080:80 \
  registry.docker.ir/openresty/openresty:latest
