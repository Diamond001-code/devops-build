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
                    // Push Docker image to Docker Hub
                    bat '"C:\\Program Files\\Git\\bin\\bash.exe" ./push.sh'
                }
            }
        }

        stage('Deploy Application') {
            steps {
                script {
                    // Deploy the Docker container using Docker Compose or Docker commands
                    bat '"C:\\Program Files\\Git\\bin\\bash.exe" ./deploy.sh'
                }
            }
        }

        stage('Check Container Status') {
            steps {
                script {
                    // Check if the container is running
                    def result = bat(script: 'docker ps --filter "name=devops-build-task" --format "{{.Names}}"', returnStdout: true).trim()
                    
                    if (result == 'devops-build-task') {
                        echo "Container is running successfully."
                    } else {
                        error "Container is not running."
                    }
                }
            }
        }
    }
}

