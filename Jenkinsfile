pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = 'docker-hub-credentials'  // This should match the credentials ID created in Jenkins
        IMAGE_NAME = 'karthiksivakumar0114/myimage'  // Docker image name with your Docker Hub username
    }

    stages {
        stage('Check Docker Installation') {
            steps {
                script {
                    // Check if Docker is installed and accessible
                    def dockerInstalled = sh(script: 'docker --version', returnStatus: true)
                    if (dockerInstalled != 0) {
                        error "Docker is not installed or not accessible on this Jenkins agent."
                    }
                }
            }
        }

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

        stage('Get Git Commit ID') {
            steps {
                script {
                    // Check if the repository is connected to Git and get the commit ID
                    if (env.GIT_COMMIT) {
                        echo "Git commit ID: ${env.GIT_COMMIT}"
                    } else {
                        echo "No Git commit ID found, using 'latest' as the tag."
                        // If GIT_COMMIT is not available, default to 'latest' as the image tag
                        env.GIT_COMMIT = 'latest'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image, tag it with your username, image name, and Git commit ID (or 'latest' if no commit ID)
                    sh "docker build -t ${IMAGE_NAME}:${env.GIT_COMMIT} ."
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    sh "docker push ${IMAGE_NAME}:${env.GIT_COMMIT}"
                }
            }
        }
    }

    post {
        always {
            // Cleanup actions or notifications can be placed here
            echo "Pipeline finished."
        }
        success {
            echo "Docker image successfully pushed to Docker Hub."
        }
        failure {
            echo "Pipeline failed."
        }
    }
}



