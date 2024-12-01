#!/bin/bash

#Running the Doc-con by running docker-compose
docker-compose up -d

#Docker image push to dockerhub

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
if [ "$GIT_BRANCH" == "origin/dev" ]; then
docker tag guvireactapp Karthiksivakumar0114/dev:app1
docker push Karthiksivakumar0114/dev:app1

elif [ "$GIT_BRANCH" == "origin/main" ]; then
docker tag guvireactapp Karthiksivakumar0114/prod:app2
docker push Karthiksivakumar0114/prod:app2
fi
