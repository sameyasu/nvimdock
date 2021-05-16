#!/bin/bash -eu

IMAGE_NAME="nvimdock-"$(id -u)
CONTAINER_NAME=${IMAGE_NAME}

docker build \
    --build-arg UID=$(id -u) \
    -t ${IMAGE_NAME} \
    .

docker run \
    --rm \
    -it \
    --detach-keys "ctrl-\\" \
    -e TERM \
    --name ${CONTAINER_NAME} \
    ${IMAGE_NAME}
