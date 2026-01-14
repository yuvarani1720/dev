#!/bin/bash

set -e

echo "=============================="
echo " Deploying Application"
echo "=============================="

# Stop existing containers
echo "Stopping existing containers..."
docker-compose down

# Start containers in detached mode
echo "Starting containers..."
docker-compose up -d

echo "=============================="
echo " Deployment Completed"
echo "=============================="

docker ps

