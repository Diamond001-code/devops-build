pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = 'docker-hub-credentials'  // This must match the ID you set for Docker Hub credentials in Jenkins
    }

    stages {
        stage('Login to Docker Hub') {
            steps {
                script {
                    // Use credentials stored in Jenkins and login to Docker Hub
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USER --password-stdin"
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in your repository
                    sh "docker build -t karthiksivakumar0114/myimage:latest ."
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    
                    sh "docker push karthiksivakumar0114/myimage:latest"
                }
            }
        }
    }
}


