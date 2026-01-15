#!/bin/bash
set -e

echo "=============================="
echo " Deploying DEV using Compose"
echo "=============================="

# Stop and remove existing containers
docker-compose down

# Pull latest image (optional but recommended)
docker-compose pull || true

# Start fresh containers
docker-compose up -d --build

echo "=============================="
echo " DEV Deployment Completed"
echo "=============================="

docker ps | grep devops_build_app_dev || true

