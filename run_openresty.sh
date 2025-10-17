#!/bin/bash

podman run -it --name openresty --rm \
  -v $PWD/nginx:/usr/local/openresty/nginx/conf/ \
  -v $PWD/example:/opt/lua \
  -p 8080:80 \
  finch
