
node {
  
    stage('Clone source') {
        git 'https://github.com/abaer123/spj.git'
    }


    stage('Maven build') {
        // buildInfo = rtMaven.run pom: 'maven-example/pom.xml', goals: 'clean install'
        sh "./mvnw  -B -Dmaven.test.failure.ignore compile"
    }

    stage('Maven test') {
        // buildInfo = rtMaven.run pom: 'maven-example/pom.xml', goals: 'clean install'
        sh "./mvnw  -B -Dmaven.test.failure.ignore test"
    }

    stage('Maven deploy') {
        // buildInfo = rtMaven.run pom: 'maven-example/pom.xml', goals: 'clean install'
        sh ""./mvnw  -B -Dmaven.test.failure.ignore test"
    }

    }
  