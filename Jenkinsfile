pipeline {
    agent any

    environment {
        DOCKER_CLI_EXPERIMENTAL = 'enabled'
    }

    stages {
        stage('Declarative: Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Check Docker Installation') {
            steps {
                script {
                    // Check if Docker is installed using the `bat` command for Windows
                    bat 'docker --version'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        bat "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                    }
                }
            }
        }

        stage('Get Git Commit ID') {
            steps {
                script {
                    // Get the Git commit ID
                    def commitId = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
                    echo "Current commit ID: ${commitId}"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    bat 'docker build -t myimage:${commitId} .'
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    bat "docker push myimage:${commitId}"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }

        failure {
            echo 'Pipeline failed.'
        }
    }
}




