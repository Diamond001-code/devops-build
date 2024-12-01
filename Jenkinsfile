pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh './build.sh' 
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'docker push karthiksivakumar0114/prod'
            }
        }

        stage('Deploy Application') {
            steps {
                sh './deploy.sh' // 
            }
        }
    }
}
