pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = 'myusername'
        IMAGE_NAME = 'myimage'
        BUILD_TAG = 'latest'
    }

    stages {
        stage('Clone Repository') {
    steps {
        git 'https://github.com/Diamond001-code/devops-build.git'  
    }
}


        stage('Build Docker Image') {
            steps {
                script {
                    bat '''
                        docker build -t %DOCKER_HUB_USERNAME%/%IMAGE_NAME%:%BUILD_TAG% .
                        docker tag %DOCKER_HUB_USERNAME%/%IMAGE_NAME%:%BUILD_TAG% %DOCKER_HUB_USERNAME%/%IMAGE_NAME%:latest
                    '''
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    bat '''
                        docker login -u %DOCKER_HUB_USERNAME% -p %DOCKER_HUB_PASSWORD%
                        docker push %DOCKER_HUB_USERNAME%/%IMAGE_NAME%:%BUILD_TAG%
                        docker push %DOCKER_HUB_USERNAME%/%IMAGE_NAME%:latest
                    '''
                }
            }
        }
    }
}

