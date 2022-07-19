#!/bin/bash
set -x

TAG="latest"
if [ ! -z $1 ]; then
    TAG=$1
fi

docker build -t mario21ic/dmc-api:$TAG ./
