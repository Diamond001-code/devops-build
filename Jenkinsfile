pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                // Use Git Bash path explicitly for the build.sh script
                bat '"C:\\Program Files\\Git\\bin\\bash.exe" ./build.sh'  // Git Bash path
                // OR use WSL if preferred
                // bat 'C:\\Windows\\System32\\wsl.exe ./build.sh'  // WSL path
            }
        }

        stage('Push to Docker Hub') {
            steps {
                // Use Git Bash path explicitly for the push.sh script
                bat '"C:\\Program Files\\Git\\bin\\bash.exe" ./push.sh'  // Git Bash path
                // OR use WSL if preferred
                // bat 'C:\\Windows\\System32\\wsl.exe ./push.sh'  // WSL path
            }
        }

        stage('Deploy Application') {
            steps {
                // Use Git Bash path explicitly for the deploy.sh script
                bat '"C:\\Program Files\\Git\\bin\\bash.exe" ./deploy.sh'  // Git Bash path
                // OR use WSL if preferred
                // bat 'C:\\Windows\\System32\\wsl.exe ./deploy.sh'  // WSL path
            }
        }
    }
}
pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('docker-hub-credentials')  // Reference the ID of the credentials you added
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Login to Docker Hub
                    sh "echo $DOCKER_CREDENTIALS_PSWD | docker login --username $DOCKER_CREDENTIALS_USR --password-stdin"

                    // Build Docker image
                    sh './build.sh'
                }
            }
        }

        // Add other stages for push and deployment here...
    }
}
