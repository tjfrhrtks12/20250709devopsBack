pipeline {
    agent any

    environment {
        IMAGE_NAME = "fastapi-back"
        CONTAINER_NAME = "fastapi-back-container"
        PORT = "8000"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Deploy') {
            steps {
                sh "docker rm -f $CONTAINER_NAME || true"
                sh "docker run -d -p ${PORT}:8000 --name $CONTAINER_NAME $IMAGE_NAME"
            }
        }

        stage('Check Running Container') {
            steps {
                echo "✅ 실행 중인 컨테이너 확인 중..."
                sh "docker ps"
            }
        }
    }

    post {
        success {
            echo "✅ FastAPI 백엔드 배포 성공!"
        }
        failure {
            echo "❌ FastAPI 백엔드 배포 실패!"
        }
    }
}
