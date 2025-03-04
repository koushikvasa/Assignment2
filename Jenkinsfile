pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-cred')
    }
    stages {
        stage('Timestamping') {
            steps {
                script {
                    // Defining a build timestamp variable
                    env.BUILD_TIMESTAMP = new Date().format("yyyyMMddHHmmss", TimeZone.getTimeZone('UTC'))
                    echo "Build timestamp: ${env.BUILD_TIMESTAMP}"
                }
            }
        }

        stage('Building a Docker Image') {
            steps {
                script {
                    // Securely handling Docker login
                    withCredentials([usernamePassword(credentialsId: 'docker-cred', 
                                                      usernameVariable: 'DOCKER_USER', 
                                                      passwordVariable: 'DOCKER_PASS')]) {
                        sh """
                            echo "\$DOCKER_PASS" | docker login -u "\$DOCKER_USER" --password-stdin
                        """
                    }

                    def imageName = "jswaroop/survey:${env.BUILD_TIMESTAMP}"
                    sh "docker build -t ${imageName} ."

                    env.IMAGE_NAME = imageName
                }
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                script {
                    sh "docker push ${env.IMAGE_NAME}"
     
