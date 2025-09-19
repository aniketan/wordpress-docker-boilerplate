#!/bin/bash

# Stop and remove containers, networks, images, and volumes created by docker-compose

echo "Stopping and removing any running containers..."
docker compose down

# Get current user UID and GID
UID=$(id -u)
GID=$(id -g)

echo "Starting docker compose with UID=$UID and GID=$GID..."
UID=$UID GID=$GID docker compose up --build
