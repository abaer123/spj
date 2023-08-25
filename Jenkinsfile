import groovy.json.*

node () {
   def mvnHome, commitId
    
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      // git 'git@github.com:CMYanko/struts2-showcase-demo.git'
      checkout scm
      
      
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      // mvnHome = tool 'M3'
      
      // sh 'git rev-parse HEAD > commit'
      // commitId = readFile('commit').trim()
      // sh "echo my commitid ${commitId}"

   }
   stage('Build') {
      // Run the maven build
      try{
        if (isUnix()) {
           sh "./mvnw  -B -Dmaven.test.failure.ignore -Drat.skip=true -f pom.xml compile -U"
        } else {
           bat(/mvnw.cmd -B -Dmaven.test.failure.ignore -Drat.skip=true clean package/)
        }
        
        currentBuild.result = 'SUCCESS'

      }catch(Exception err){
        currentBuild.result = 'FAILURE'
      
      }

      sh "echo current build status ${currentBuild.result}"
      /*
      if (currentBuild.result == 'FAILURE') {
        postGitHub(commitId, 'failure', 'build', 'Build failed')
        return
      } else {
        postGitHub(commitId, 'success', 'build', 'Build succeeded')
      } */
      
   }

   
   stage('Lifecycle Evaluation'){
    // postGitHub commitId, 'pending', 'analysis', 'Nexus Lifecycle Analysis is running'

      def policyEvaluationResult = nexusPolicyEvaluation failBuildOnNetworkError: false, iqApplication: 'struts2-rce', iqStage: 'stage-release', jobCredentialsId: ''
    /*  if (currentBuild.result == 'FAILURE'){
        postGitHub commitId, 'failure', 'analysis', 'Nexus Lifecycle Analysis failed',"${policyEvaluationResult.applicationCompositionReportUrl}"
        return
      } else {
        postGitHub commitId, 'success', 'analysis', 'Nexus Lifecycle Analysis succeeded',"${policyEvaluationResult.applicationCompositionReportUrl}"
      } */
   }
   
}

def postGitHub(commitId, state, context, description, target_url="http://localhost:8080") {
         def payload = JsonOutput.toJson(
           state: state,
           context: context,
           description: description,
           target_url: target_url
          )
        sh "curl -H \"Authorization: token ${gitHubApiToken}\" --request POST --data '${payload}' https://api.github.com/repos/${project}/statuses/${commitId}"
}

// pipeline { 
//     agent any 
//     options {
//         skipStagesAfterUnstable()
//     }
//     stages {
//         stage('Preparation') { 
//             steps { 
//                 git 'https://github.com/abaer123/spj.git'
//             }
//         }
//         stage('Test'){
//             steps {
//                 sh 'make check'
//                 junit 'reports/**/*.xml' 
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 sh 'make publish'
//             }
//         }
//     }
// }


// pipeline{
//     agent any
//     options {
//         //timeout counter after agent is allocated
//         timeout(time: 1, unit: 'SECONDS')
//     }
//     stages {
//         stage('Preparation') {
//             steps {
//                  checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/abaer123/spj.git']])
//             }
//         }
//         stage('Build') {
//             steps {
//                  sh 'mvnw  -B -Dmaven.test.failure.ignore compile'
//             }
//         }



//     }
// }
// import groovy.json.*

// pipeline {
//     agent any
//     stages {
//         stage('Preparation') {
//             steps {
//                 checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/abaer123/spj.git']])
//                 sh './mvnw  -B -Dmaven.test.failure.ignore compile'
//                 sh './mvnw  -B -Dmaven.test.failure.ignore test'
//                 sh './mvnw  -B -Dmaven.test.failure.ignore deploy'
//             }
//         }
        
        
//     }
// }


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

