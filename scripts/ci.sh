#!/bin/bash

set -e

echo "=== CI START ==="

echo "Checking files..."
test -f Dockerfile
test -f compose.yaml
test -f nginx.conf
test -f index.html

echo "Building services..."
sudo docker compose build

echo "Starting services..."
sudo docker compose up -d

echo "Waiting for services..."
sleep 3

echo "Testing web server..."
curl -f http://localhost:8082

echo "Testing backend through Nginx..."
curl -f http://localhost:8082/api/

echo "Stopping services..."
sudo docker compose down

echo "=== CI PASSED ==="
