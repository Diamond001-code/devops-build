pipeline {
    agent any

    environment {
        DOCKER_CLI_EXPERIMENTAL = 'enabled'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Check Docker Installation') {
            steps {
                bat 'docker --version'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Securely use credentials with 'withCredentials'
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        bat '''echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin'''
                    }
                }
            }
        }

        stage('Get Git Commit ID') {
            steps {
                script {
                    def commitId = bat(script: "git rev-parse --short HEAD", returnStdout: true).trim()
                    echo "Current commit ID: ${commitId}"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t myimage:${commitId} ."
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
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
