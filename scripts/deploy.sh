#!/bin/bash

set -e

IMAGE_TAG="$1"

if [ -z "$IMAGE_TAG" ]; then
  echo "Usage: $0 <image-tag>"
  exit 1
fi

echo "=== DEPLOY START ==="
echo "Deploying image: $IMAGE_TAG"

sudo IMAGE_TAG="$IMAGE_TAG" docker compose -f compose.deploy.yaml up -d

echo "Waiting for application..."
sleep 3

echo "Checking website..."
curl -f http://localhost:8082

echo
echo "=== DEPLOY SUCCESS ==="
