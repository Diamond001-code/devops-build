#!/bin/bash

# Log in to Docker Hub using environment variables
echo "dckr_pat_bjhsjC32LQTdF7CJj37Nl2b74iY" | docker login --username "karthiksivakumar0114" --password-stdin

# Push the Docker image to Docker Hub
docker push "karthiksivakumar0114/dev:latest"
