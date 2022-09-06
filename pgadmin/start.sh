#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p "${SCRIPT_DIR}"/data

if ! docker network ls | grep -q "doc-net";
then
  echo Creating docker bridge
  docker network create doc-net
fi

docker run \
    --name pgadmin \
    -d \
    -it \
    --rm \
    -p 8080:80 \
    --network="doc-net" \
    -e PGADMIN_DEFAULT_EMAIL="${PGADMIN_EMAIL}" \
    -e PGADMIN_DEFAULT_PASSWORD="${PGADMIN_PASSWORD}" \
    -v "${SCRIPT_DIR}"/data/pgadmin:/var/lib/pgadmin \
    dpage/pgadmin4
