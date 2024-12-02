#!/bin/bash
if [ $GIT_BRANCH == "dev" ]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u karthiksivakumar0114 -p dckr_pat_pMAsmOeEalehL_PdwSyBKwD2-7I
    docker tag test karthiksivakumar0114/dev
    docker push karthiksivakumar0114/dev

elif [ $GIT_BRANCH == "origin/main" ]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u karthiksivakumar0114 -p dckr_pat_pMAsmOeEalehL_PdwSyBKwD2-7I
    docker tag test karthiksivakumar0114/prod 
    docker push karthiksivakumar0114/prod
fi
