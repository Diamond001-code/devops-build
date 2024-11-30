#!/bin/bash

# Set your Docker Hub username and repository name (if not already set in Jenkins environment)
DOCKER_USERNAME="karthik kavi"
DOCKER_PASSWORD="dckr_pat_bjmeR0hYBq8ZGhyqTZxwVRVMY_U"
DOCKER_REPO="karthiksivakumar0114/dev"

# Log in to Docker Hub
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

# Push the image to Docker Hub
docker push "$DOCKER_REPO:latest"

# Logout from Docker Hub (optional but good practice)
docker logout
