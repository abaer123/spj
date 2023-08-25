
node {
    // // Get Artifactory server instance, defined in the Artifactory Plugin administration page.
    // def server = Artifactory.server "SERVER_ID"
    // // Create an Artifactory Maven instance.
    // def rtMaven = Artifactory.newMavenBuild()
    // def buildInfo

    stage('Clone sources') {
        git url: 'https://github.com/abaer123/spj.git'
    }

    // stage('Artifactory configuration') {
    //     // Tool name from Jenkins configuration
    //     rtMaven.tool = "Maven-3.3.9"
    //     // Set Artifactory repositories for dependencies resolution and artifacts deployment.
    //     rtMaven.deployer releaseRepo:'libs-release-local', snapshotRepo:'libs-snapshot-local', server: server
    //     rtMaven.resolver releaseRepo:'libs-release', snapshotRepo:'libs-snapshot', server: server
    // }

    stage('Maven build') {
        // buildInfo = rtMaven.run pom: 'maven-example/pom.xml', goals: 'clean install'
          sh "./mvnw  -B -Dmaven.test.failure.ignore compile"
    }

    stage('Maven test') {
        // buildInfo = rtMaven.run pom: 'maven-example/pom.xml', goals: 'clean install'
          sh "./mvnw  -B -Dmaven.test.failure.ignore test"
    }

    // stage('Publish build info') {
    //     server.publishBuildInfo buildInfo
    // }
}

    

// import groovy.json.*

// node () {
//    def mvnHome, commitId
//    stage('Preparation') { // for display purposes
//       // Get some code from a GitHub repository
//       // git 'git@github.com:CMYanko/struts2-showcase-demo.git'
//       checkout scm
      
      
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      // mvnHome = tool 'M3'
      
      // sh 'git rev-parse HEAD > commit'
      // commitId = readFile('commit').trim()
      // sh "echo my commitid ${commitId}"

//    }
//    stage('Build') {
//       // Run the maven build
//       try{
//         if (isUnix()) {
//            sh "./mvnw  -B -Dmaven.test.failure.ignore compile"
//         } else {
//            bat("mvnw.cmd -B -Dmaven.test.failure.ignore clean package")
//         }
        
//         currentBuild.result = 'SUCCESS'

//       }
      
//       catch(Exception err){
//         currentBuild.result = 'FAILURE'
      
//       }

//    stage('Test') {
//       // Run the maven build
//       try{
//         if (isUnix()) {
//            sh "./mvnw  -B -Dmaven.test.failure.ignore test"
//         } else {
//            bat("mvnw.cmd -B -Dmaven.test.failure.ignore test")
//         }
        
//         currentBuild.result = 'SUCCESS'

//       }catch(Exception err){
//         currentBuild.result = 'FAILURE'
      
//       }


//       sh "echo current build status ${currentBuild.result}"
//       /*
//       if (currentBuild.result == 'FAILURE') {
//         postGitHub(commitId, 'failure', 'build', 'Build failed')
//         return
//       } else {
//         postGitHub(commitId, 'success', 'build', 'Build succeeded')
//       } */
      
//    }

   
//    stage('Lifecycle Evaluation'){
//     // postGitHub commitId, 'pending', 'analysis', 'Nexus Lifecycle Analysis is running'

//       def policyEvaluationResult = nexusPolicyEvaluation failBuildOnNetworkError: false, iqApplication: '1422', iqStage: 'stage-release', jobCredentialsId: ''
//     /*  if (currentBuild.result == 'FAILURE'){
//         postGitHub commitId, 'failure', 'analysis', 'Nexus Lifecycle Analysis failed',"${policyEvaluationResult.applicationCompositionReportUrl}"
//         return
//       } else {
//         postGitHub commitId, 'success', 'analysis', 'Nexus Lifecycle Analysis succeeded',"${policyEvaluationResult.applicationCompositionReportUrl}"
//       } */
//    }
   
}

// def postGitHub(commitId, state, context, description, target_url="http://localhost:8080") {
//          def payload = JsonOutput.toJson(
//            state: state,
//            context: context,
//            description: description,
//            target_url: target_url
//           )
//         sh "curl -H \"Authorization: token ${gitHubApiToken}\" --request POST --data '${payload}' https://api.github.com/repos/${project}/statuses/${commitId}"
// }

  