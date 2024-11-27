#!/bin/bash

# Set variables
IMAGE_NAME="karthiksivakumar0114/dev"   # Replace with your Docker Hub username and repository
TAG="latest"                        # Change the tag if needed
DOCKER_COMPOSE_FILE="docker-compose.yml"

# Optional: Push the image to Docker Hub (uncomment if needed)
echo "Pushing Docker image to Docker Hub..."
docker push $IMAGE_NAME:$TAG
if [ $? -eq 0 ]; then
  echo "Docker image pushed successfully: $IMAGE_NAME:$TAG"
else
  echo "Failed to push Docker image!"
  exit 1
fi

# Deploy using Docker Compose
echo "Deploying container using Docker Compose..."
docker-compose -f $DOCKER_COMPOSE_FILE up -d

# Check if the deployment was successful
if [ $? -eq 0 ]; then
  echo "Container deployed successfully!"
else
  echo "Container deployment failed!"
  exit 1
fi
