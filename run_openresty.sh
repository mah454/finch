#!/bin/bash

podman run -it --name openresty --rm \
  -v $PWD/nginx:/usr/local/openresty/nginx/conf/ \
  -v $PWD/lua:/opt/lua \
  -p 8080:80 \
  --ulimit nofile=50000:50000 \
  --ulimit nproc=6400:6400 \
  registry.docker.ir/openresty/openresty
# registry.docker.ir/openresty/openresty:alpine-fat
