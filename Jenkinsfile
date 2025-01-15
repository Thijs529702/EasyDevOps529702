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
        stage('Security Scan with Trivy') {
            steps {
                script {
                    // Voer een beveiligingsscan uit met Trivy
                    sh '''
                    docker run --rm -v $(pwd):/app aquasec/trivy filesystem /app/out/frontend > trivy-report.txt
                    '''
                }
            }
        }
        stage('Display Trivy Report') {
            steps {
                script {
                    // Toon de Trivy-rapportage
                    echo "=== Trivy Scan Report ==="
                    sh 'cat trivy-report.txt'
                }
            }
        }
    }
}
