#!/usr/bin/env bash

IMAGE_NAME=${IMAGE_NAME:-leoh0/tox-openstack-base}
TAG=${TAG:-latest}

OPTS=""
if [[ "$1" == "fresh" ]]; then
  OPTS="--no-cache"
fi

docker build $OPTS -t $IMAGE_NAME:$TAG .

if [[ $? == 0 ]]; then
  docker push $IMAGE_NAME:$TAG
fi
