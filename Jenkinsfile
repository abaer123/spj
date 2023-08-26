// Pipeline file to:
    // Checkout pet-clinic source code
    // Build the pet-clinic app with maven compile target
    // Deploy the .jar file to Artifactory

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
    }
}


// import groovy.json.*

// node () {
  
//     stage('git source') {
//         // git 'https://github.com/abaer123/spj.git'
//         checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/abaer123/spj.git']])
//     }


//     stage('Build') {
//       // Run the maven build
//        try{
//          if (isUnix()) {
//             sh "./mvnw  -B -Dmaven.test.failure.ignore -Drat.skip=true -f pom.xml compile -U"
//          } else {
//             bat(/mvnw.cmd -B -Dmaven.test.failure.ignore -Drat.skip=true compile/)
//         }
        
//         currentBuild.result = 'SUCCESS'

//       }catch(Exception err){
//         currentBuild.result = 'FAILURE'
      
//       }

//     stage('Maven test') {
//         // buildInfo = rtMaven.run pom: 'maven-example/pom.xml', goals: 'clean install'
//         sh './mvnw  -B -Dmaven.test.failure.ignore test'
//     }

//     stage('Maven deploy') {
//         // buildInfo = rtMaven.run pom: 'maven-example/pom.xml', goals: 'clean install'
//         sh './mvnw  -B -Dmaven.test.failure.ignore deploy'
//     }

//     }
  

  //Pipeline script to checkout code
// checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/abaer123/spj.git']])

// Maven compile
// sh './mvnw  -B -Dmaven.test.failure.ignore compile'

//Maven test
// sh './mvnw  -B -Dmaven.test.failure.ignore test'

