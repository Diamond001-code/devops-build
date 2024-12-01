pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = 'docker-hub-credentials'  // The ID of the credentials you created in Jenkins
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
                    sh "docker build -t myusername/myimage:latest ."
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Push the built Docker image to Docker Hub
                    sh "docker push myusername/myimage:latest"
                }
            }
        }
    }
}


