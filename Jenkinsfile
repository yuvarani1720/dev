pipeline {
    agent any

    environment {
        DOCKER_USER = "yuvarani1996"
        APP_IMAGE   = "app-image"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/yuvarani1720/dev.git',
                    branch: "${BRANCH_NAME}"
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh '''
                  docker build -t ${APP_IMAGE} .
                '''
            }
        }

        stage('Tag & Push Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER_NAME',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                      echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER_NAME" --password-stdin

                      if [ "$BRANCH_NAME" = "dev" ]; then
                          echo "Tagging DEV image"
                          docker tag ${APP_IMAGE} ${DOCKER_USER}/dev:latest
                          docker push ${DOCKER_USER}/dev:latest

                      elif [ "$BRANCH_NAME" = "main" ]; then
                          echo "Tagging PROD image"
                          docker tag ${APP_IMAGE} ${DOCKER_USER}/prod:latest
                          docker push ${DOCKER_USER}/prod:latest

                      else
                          echo "Skipping Docker push for branch: $BRANCH_NAME"
                      fi
                    '''
                }
            }
        }

        stage('Deploy DEV') {
            when {
                branch 'dev'
            }
            steps {
                echo "Deploying DEV environment"
                sh 'chmod +x deploy_dev.sh'
                sh './deploy_dev.sh'
            }
        }

        stage('Deploy PROD') {
            when {
                branch 'main'
            }
            steps {
                echo "Deploying PROD environment"
                sh 'chmod +x deploy_prod.sh'
                sh './deploy_prod.sh'
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully for branch: ${BRANCH_NAME}"
        }
        failure {
            echo "❌ Pipeline failed for branch: ${BRANCH_NAME}"
        }
        always {
            sh 'docker logout || true'
        }
    }
}

