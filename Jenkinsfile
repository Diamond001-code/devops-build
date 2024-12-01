pipeline {
    agent any

    stages {
        stage('Build Dev Image') {
           
            steps {
                script {
                    sh 'chmod +x build.sh'
                    sh './build.sh'
                }
            }
        }

        stage('Push Dev Image') {
           
            steps {
                script {
                    sh 'chmod +x deploy.sh'
                    sh './deploy.sh'
                }
            }
        }

    }
}