pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')  
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Login to Docker Hub
                    sh "echo $DOCKER_HUB_CREDENTIALS_PSW | docker login --username $DOCKER_HUB_CREDENTIALS_USR --password-stdin"

                    // Build Docker image
                    bat '"C:\\Program Files\\Git\\bin\\bash.exe" ./build.sh'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    bat '"C:\\Program Files\\Git\\bin\\bash.exe" ./push.sh'
                }
            }
        }

        stage('Deploy Application') {
            steps {
                script {
                    bat '"C:\\Program Files\\Git\\bin\\bash.exe" ./deploy.sh'
                }
            }
        }
    }
}
