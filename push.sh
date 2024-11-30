#!/bin/bash

# Log in to Docker Hub using environment variables from GitHub Actions
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

# Push the Docker image to Docker Hub
docker push "$DOCKER_REPO:latest"

# Logout from Docker Hub (optional but good practice)
docker logout
