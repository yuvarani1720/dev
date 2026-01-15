#!/bin/bash
set -e

echo "=============================="
echo " Deploying DEV using Compose"
echo "=============================="

docker-compose -f docker-compose-dev.yml down || true
docker-compose -f docker-compose-dev.yml pull || true
docker-compose -f docker-compose-dev.yml up -d

echo "=============================="
echo " DEV Deployment Completed"
echo "=============================="

docker ps | grep devops_build_app_dev || true

