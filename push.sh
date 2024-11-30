#!/bin/bash

# Log in to Docker Hub using environment variables
echo "dckr_pat_bjmeR0hYBq8ZGhyqTZxwVRVMY_U" | docker login --username "karthiksivakumar0114" --password-stdin

# Push the Docker image to Docker Hub
docker push "karthiksivakumar0114/dev:latest"
