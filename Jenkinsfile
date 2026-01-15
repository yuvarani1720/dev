pipeline {
    agent any

    environment {
        DOCKER_USER = "yuvarani1996"
    }

    stages {

        stage('Checkout Code') {
            steps {
                // Checkout the branch that triggered the build
                git url: 'https://github.com/yuvarani1720/dev.git', branch: "${BRANCH_NAME}"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build -t app-image .
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
                            docker tag app-image ${DOCKER_USER}/dev:latest
                            docker push ${DOCKER_USER}/dev:latest
                        elif [ "$BRANCH_NAME" = "main" ]; then
                            docker tag app-image ${DOCKER_USER}/prod:latest
                            docker push ${DOCKER_USER}/prod:latest
                        else
                            echo "Not dev or master branch. Skipping Docker push."
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
        sh 'chmod +x deploy_dev.sh'
        sh './deploy_dev.sh'
    }
}

    }
}

