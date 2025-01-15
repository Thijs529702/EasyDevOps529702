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
                bat 'dotnet publish frontend/EasyDevOpsFrontend/EasyDevOpsFrontend.csproj -c Release -o ../publish/frontend'
            }
        }
        stage('Run Frontend') {
            steps {
                bat 'cd ../publish/frontend && EasyDevOpsFrontend.exe'
            }
        }
    }
}
