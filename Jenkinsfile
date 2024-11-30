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
                sh 'docker push karthiksivakumar0114/prod'
            }
        }

        stage('Deploy Application') {
            steps {
                sh './deploy.sh' // Deploys the application to your server
            }
        }
    }
}
