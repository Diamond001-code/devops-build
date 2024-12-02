#!/bin/bash

docker login -u karthiksivakumar0114  -p dckr_pat_pMAsmOeEalehL_PdwSyBKwD2-7I

if [ $GIT_BRANCH == "dev" ]; then
       sh 'chmod +x build.sh'
       sh './build.sh'

        docker tag test karthiksivakumar0114/dev
        docker push karthiksivakumar0114/dev

elif [ $GIT_BRANCH == "master" ]; then
        sh 'chmod +x build.sh'
        sh './build.sh'

        docker tag test karthiksivakumar0114/prod
        docker push karthiksivakumar0114/prod

