#!/bin/bash

set -e

echo "=== DEPLOY START ==="

echo "Starting application..."
sudo docker compose -f compose.deploy.yaml up -d

echo "Waiting for application..."
sleep 3

echo "Checking website..."
curl -f http://localhost:8082

echo "=== DEPLOY SUCCESS ==="

