pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = 'docker-hub-credentials'  // This should match the credentials ID created in Jenkins
    }

    stages {
        stage('Login to Docker Hub') {
            steps {
                script {
                    // Using Jenkins' credentials store for security
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Login to Docker Hub using the credentials stored in Jenkins
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USER --password-stdin"
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image, tag it with your username and the image name
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


