// Pipeline file to:
    // Checkout pet-clinic source code
    // Build the pet-clinic app with maven compile target
    // Deploy the .jar file to Artifactory
    //Build docker image - save to .tar file

pipeline {
    agent any
    stages {
        //checkout source
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/abaer123/spj.git']])
            }
        }
        
        // Compile source
         stage('Build') {
            steps {
                sh './mvnw compile '
            }
        }
        
        //Test Source
         stage('Test') {
            steps {
                sh './mvnw test'
            }
        }
        
        //stage Deploy to deploy the jar file to Artifactory using pom.xml repository definition.
         stage('Deploy') { 
            steps {
                sh './mvnw deploy'
            }
        }
        
         //Build and package Docker Image using shell script to use Dockfile and save as .tar
         stage('Docker-Build-Package') { 
            steps {
                sh './docker_build_package.sh'
            }
        }
        // put in jf docker scan here
    }
}


