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
        stage('Restore WebApp') {
            steps {
                bat 'dotnet restore WebApp/WebApp.csproj'
            }
        }
        stage('Build WebApp') {
            steps {
                bat 'dotnet build WebApp/WebApp.csproj --configuration Release'
            }
        }
        stage('Test WebApp') {
            steps {
                bat 'dotnet test WebApp/WebApp.csproj'
            }
        }
        stage('Publish WebApp') {
            steps {
                bat 'dotnet publish WebApp/WebApp.csproj -c Release -o ./publish'
            }
        }
    }
}
