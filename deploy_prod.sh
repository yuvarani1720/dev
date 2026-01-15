#!/bin/bash
set -e

echo "=============================="
echo " Deploying PROD Application"
echo "=============================="

CONTAINER_NAME="devops_build_app_prod"
IMAGE_NAME="yuvarani1996/prod:latest"

docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

docker run -d \
  --name $CONTAINER_NAME \
  -p 80:80 \
  $IMAGE_NAME

echo "PROD deployment successful!"

