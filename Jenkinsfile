
node {
  
    stage('git source') {
        // git 'https://github.com/abaer123/spj.git'
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/abaer123/spj.git']])
    }


    stage('Maven build') {
        // buildInfo = rtMaven.run pom: 'maven-example/pom.xml', goals: 'clean install'
        sh './mvnw  -B -Dmaven.test.failure.ignore compile'
    }

    stage('Maven test') {
        // buildInfo = rtMaven.run pom: 'maven-example/pom.xml', goals: 'clean install'
        sh './mvnw  -B -Dmaven.test.failure.ignore test'
    }

    stage('Maven deploy') {
        // buildInfo = rtMaven.run pom: 'maven-example/pom.xml', goals: 'clean install'
        sh './mvnw  -B -Dmaven.test.failure.ignore deploy'
    }

    }
  

  //Pipeline script to checkout code
// checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/abaer123/spj.git']])

// Maven compile
// sh './mvnw  -B -Dmaven.test.failure.ignore compile'

//Maven test
// sh './mvnw  -B -Dmaven.test.failure.ignore test'

