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
                bat '''
                cd ../publish/frontend
                EasyDevOpsFrontend.exe
                '''
            }
        }
        stage('Publish to GitHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'github-credentials', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                    bat '''
                    cd ../publish/frontend
                    git init
                    git remote add origin https://$GIT_USERNAME:$GIT_PASSWORD@github.com/Thijs529702/EasyDevOps529702.git
                    git checkout -b publish || git checkout publish
                    git add .
                    git commit -m "Add published files"
                    git push origin publish --force
                    '''
                }
            }
        }
    }
}
