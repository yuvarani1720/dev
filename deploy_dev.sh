#!/bin/bash
set -e

echo "=============================="
echo " Deploying DEV using Compose"
echo "=============================="

docker-compose -f docker-compose-dev.yml down
docker-compose -f docker-compose-dev.yml up -d

echo "DEV deployment completed!"

