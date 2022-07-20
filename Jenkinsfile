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
      }
    }

  }
}

