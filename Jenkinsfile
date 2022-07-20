pipeline {
  agent any

  parameters {
    string(name: 'DOCKERHUB_CREDENTIAL', defaultValue: 'dockerhub-token', description: 'Acceso de escritura a docker hub')
  }

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
        parallel (
          syntax: { echo "pruebas de sintaxis" },
          linter: { echo "flake8" }
        )
      }
    }

    stage ("Upload") {
      steps {
        echo "subir a docker hub"
        withCredentials([usernamePassword(credentialsId: "${params.DOCKERHUB_CREDENTIAL}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
          sh "docker push mario21ic/dmc-api:${env.BUILD_NUMBER}"
          sh "docker logout"
        }
      }
    }

  }
}

