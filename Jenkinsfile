pipeline {
  agent any

  stages {

    stage ("Repo") {
      steps {
        checkout scm
      }
    }

    stage ("Build") {
      steps {
        sh "./docker-build.sh ${env.BUILD_NUMBER}"
      }
    }

    stage ("Test") {
      steps {
        echo "ejecucion de tests"
      }
    }

    stage ("Upload") {
      steps {
        echo "subir a docker hub"
        withCredentials([usernamePassword(credentialsId: "dockerhub-token", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
          sh "docker push mario21ic/dmc-api:${env.BUILD_NUMBER}"
          sh "docker logout"
        }
      }
    }

  }
}

