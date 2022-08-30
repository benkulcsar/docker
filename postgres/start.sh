#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p "${SCRIPT_DIR}"/data

if ! docker network ls | grep -q "doc-net";
then
  echo Creating docker bridge
  docker network create doc-net
fi

docker run \
    --name postgres \
    -d \
    -it \
    --rm \
    -p 5432:5432 \
    --network="doc-net" \
    -e POSTGRES_USER="${LOCAL_POSTGRES_USER}" \
    -e POSTGRES_PASSWORD="${LOCAL_POSTGRES_PASSWORD}" \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v "${SCRIPT_DIR}"/data:/var/lib/postgresql/data \
    postgres:12.8


