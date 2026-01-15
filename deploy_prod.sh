#!/bin/bash
set -e

echo "=============================="
echo " Deploying PROD using Compose"
echo "=============================="

docker-compose -f docker-compose-prod.yml down
docker-compose -f docker-compose-prod.yml up -d

echo "PROD deployment completed!"

