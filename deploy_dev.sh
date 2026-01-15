#!/bin/bash
set -e

echo "=============================="
echo " Deploying DEV Application"
echo "=============================="

CONTAINER_NAME="devops_build_app_dev"
IMAGE_NAME="yuvarani1996/dev:latest"

docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

docker run -d \
  --name $CONTAINER_NAME \
  -p 8081:80 \
  $IMAGE_NAME

echo "DEV deployment successful!"

