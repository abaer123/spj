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
                sh './mvnw  -B -Dmaven.test.failure.ignore -f pom.xml compile -U'
            }
        }
        //Test Source
         stage('Test') {
            steps {
                sh './mvnw  -B -Dmaven.test.failure.ignore -f pom.xml test'
            }
        }
        //stage Deploy to deploy the jar file to Artifactory
         stage('Deploy') { 
            steps {
                sh './mvnw  -B -Dmaven.test.failure.ignore -f pom.xml deploy'
            }
        }
         //Build and package Docker Image using shell script
         stage('Docker-Build-Package') { 
            steps {
                sh './docker_build_package.sh'
            }
        }
        // put in jf docker scan here
    }
}


