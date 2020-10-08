#!/bin/bash
set -ex

IMAGE=build-jasper
SRC=/home/build-user/jasper/out/linux/Jasper.tar.gz

docker build --tag=$IMAGE . 2>&1 | tee build.log

CONTAINER=$(docker create $IMAGE)
docker cp $CONTAINER:$SRC .
docker rm $CONTAINER
