#!/bin/bash

# Set variables
IMAGE_NAME="karthiksivakumar0114/dev"   # Replace with your Docker Hub username and repository
TAG="latest"                        

# Login to Docker Hub
echo "dckr_pat_bjhsjC32LQTdF7CJj37Nl2b74iY" | docker login --username "karthiksivakumar0114" --password-stdin
if [ $? -ne 0 ]; then
  echo "Docker login failed!"
  exit 1
fi

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
