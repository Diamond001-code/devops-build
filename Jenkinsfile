pipeline {
    agent any

    stages {
        stage('Build Dev Image') {
            steps {
                script {
                    sh './build.sh'
                }
            }
        }

        stage('Push Dev Image') {
            steps {
                script {
                    sh './deploy.sh'
                }
            }
        }
    }
}
