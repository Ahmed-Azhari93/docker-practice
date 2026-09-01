#!/bin/bash

set -e

echo "=============================="
echo "       PIPELINE START"
echo "=============================="

echo ""
echo ">>> Running CI..."
./scripts/ci.sh

echo ""
echo ">>> CI PASSED"
echo ">>> Running CD..."

./scripts/deploy.sh

echo ""
echo "=============================="
echo "      PIPELINE SUCCESS"
echo "=============================="
