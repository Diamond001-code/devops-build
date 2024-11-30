pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                bat 'bash ./build.sh'  // Assuming you have Git Bash installed and available in the PATH
            }
        }

        stage('Push to Docker Hub') {
            steps {
                bat 'docker push karthiksivakumar0114/dev'  // Docker push command in bat format
            }
        }

        stage('Deploy Application') {
            steps {
                bat 'bash ./deploy.sh'  // Again, using bash if you need a Unix-like environment, or use batch commands if possible
            }
        }
    }
}

