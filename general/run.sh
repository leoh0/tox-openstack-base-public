#!/usr/bin/env bash

PROJECT=${PWD##*/}

if [[ "$PROJECT" == "general" ]]; then
  echo "ERROR: Use this script in projects directory."
  exit
fi

IMAGE_NAME=${IMAGE_NAME:-leoh0/tox-$PROJECT-base}
TAG=${TAG:-mitaka}

docker build -f ../../general/Dockerfile \
  --build-arg PROJECT=$PROJECT \
  --build-arg GITBRANCH=stable/$TAG \
  -t $IMAGE_NAME:$TAG ../../general/

if [[ $? == 0 ]]; then
  docker push $IMAGE_NAME:$TAG
fi
