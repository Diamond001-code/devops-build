#!/bin/bash

# Set variables
IMAGE_NAME="karthiksivakumar0114/prod"   # Replace with your Docker Hub username and repository
TAG="latest"                        

# Build the Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME:$TAG .

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker image built successfully: $IMAGE_NAME:$TAG"
else
  echo "Docker image build failed!"
  exit 1
fi
