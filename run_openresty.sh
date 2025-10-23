#!/bin/bash

CMD=$(which podman)
if [ -z $CMD ]; then
  CMD=$(which docker)
fi

echo "[*] Use [$CMD] as container engine"
echo "[*] Start finch container"
$CMD run -it --rm \
  --name finch \
  -v $PWD/nginx:/usr/local/openresty/nginx/conf/ \
  -v $PWD/example:/opt/lua \
  -p 8080:80 \
  finch
