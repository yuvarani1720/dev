#!/bin/bash

# Exit immediately if a command fails
set -e

IMAGE_NAME="devops-build-app"
TAG="latest"

echo "=============================="
echo " Building Docker Image"
echo " Image: $IMAGE_NAME:$TAG"
echo "=============================="

docker build -t $IMAGE_NAME:$TAG .

echo "=============================="
echo " Docker Image Built Successfully"
echo "=============================="

docker images | grep $IMAGE_NAME

