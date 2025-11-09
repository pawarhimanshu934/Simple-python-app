@Library('shared-library') _
pipeline{
    agent { label 'bird'}
    
    stages{
        stage('Code'){
            steps{
                script{
                    clone("https://github.com/pawarhimanshu934/Simple-python-app.git","main")
                }
                // echo "Code clone success (Jenkins)"
            }
        }
        stage('Build'){
            steps{
                sh "docker build -t simple-app:latest ."
                echo "Build success"
            }
        }
        stage("Push"){
            steps{
                withCredentials([usernamePassword(
                    'credentialsId': "DockerHub-cred", 
                    usernameVariable: "DockerHubUser",
                    passwordVariable: "DockerHubPass")]){ 
                sh "docker login -u ${env.DockerHubUser} -p ${env.DockerHubPass}"
                sh "docker image tag simple-app:latest ${env.DockerHubUser}/simple-app:latest"
                sh "docker push ${env.DockerHubUser}/simple-app:latest"
                echo "Image pushed to DockerHub"
                } 
            }
        }
        stage('Deploy'){
            steps{
                sh "docker compose up -d"
                echo "Deploy successful"
            }
        }
    }
}
