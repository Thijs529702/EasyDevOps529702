pipeline {
    agent any
    stages {
        stage('Restore Frontend') {
            steps {
                bat 'dotnet restore frontend/EasyDevOpsFrontend/EasyDevOpsFrontend.csproj'
            }
        }
        stage('Build Frontend') {
            steps {
                bat 'dotnet build frontend/EasyDevOpsFrontend/EasyDevOpsFrontend.csproj --configuration Release'
            }
        }
        stage('Publish Frontend') {
            steps {
                bat 'dotnet publish frontend/EasyDevOpsFrontend/EasyDevOpsFrontend.csproj -c Release -o ./out/frontend'
            }
        }
        stage('Pull Trivy Docker Image') {
            steps {
                bat 'docker pull aquasec/trivy'
            }
        }
        stage('Security Scan with Trivy') {
            steps {
                bat 'docker run --rm -v "%cd%:/app" aquasec/trivy filesystem /app/out/frontend --severity HIGH,CRITICAL --debug > trivy-report.txt'
                bat 'type trivy-report.txt'
            }
        }
        stage('Display Trivy Report') {
            steps {
                bat 'type trivy-report.txt'
            }
        }
    }
}
