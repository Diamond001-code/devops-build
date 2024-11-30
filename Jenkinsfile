pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh './build.sh' // Calls the script to build the Docker image
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'karthiksivakumar0114/dev'
            }
        }

        stage('Deploy Application') {
            steps {
                sh './deploy.sh' // Deploys the application to your server
            }
        }
    }
}
