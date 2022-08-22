#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker run \
    -it \
    --rm \
    -e AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
    -e AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
    -e TF_VAR_test_s3_bucket="${TF_VAR_test_s3_bucket}" \
    -p 8888:8888 \
    -v "${SCRIPT_DIR}"/data:/home/jovyan/work \
    pyspark-notebook-aws
