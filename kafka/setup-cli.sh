#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Need Java 8+

cd "${SCRIPT_DIR}"
wget https://downloads.apache.org/kafka/3.2.1/kafka_2.13-3.2.1.tgz
rm cd kafka_2.13-3.2.1.tgz
cd kafka_2.13-3.2.1

