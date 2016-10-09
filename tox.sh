#!/usr/bin/env bash

PROJECT=${PWD##*/}
IMAGE_NAME=${IMAGE_NAME:-tox-$PROJECT}
TAG=${TAG:-mitaka}

cat > Dockerfile << EOF
FROM leoh0/tox-${PROJECT}-base:${TAG}

RUN .tox/py27/bin/pip install -r requirements.txt -r test-requirements.txt

CMD ["tox", "-e", "py27"]
EOF

trap 'rm -f Dockerfile' SIGTERM SIGINT EXIT

docker build -t $IMAGE_NAME:$TAG .

if [[ "$?" == 0 ]]; then
    docker run -ti --rm $IMAGE_NAME:$TAG $@
fi

