pipeline {
  agent any
  options {
    timestamps()
    timeout(time: 1, unit: 'HOURS')
  }

  parameters {
    string(name: 'dockerhub-credential', defaultValue: 'dockerhub-token', description: '')
    string(name: 'SLACK_CHANNEL', defaultValue: '#deploys', description: '')
    //choice(name: 'TYPE', choices: 'aut\ncron\ndata', description: 'Autoscaling, Cron or Data')
    booleanParam(name: 'UPLOAD', defaultValue: false, description: 'Upload to docker hub')
  }

  environment {
    ARTIFACTOR = "${env.BUILD_NUMBER}.zip"
    SLACK_MESSAGE = "Job '${env.JOB_NAME}' Build ${env.BUILD_NUMBER}"
  }

  stages {
    stage ("Repository") {
      steps {
        checkout scm
      }
    }

    stage ("Build") {
      steps {
        echo "build"
        sh "zip ${env.ARTIFACTOR} src/"
        echo "${env.BUILD_NUMBER}"
        echo "${env.ARTIFACTOR}"

        echo "${env.SLACK_CHANNEL}"
        echo "${env.SLACK_MESSAGE}"

        sh "echo ${env.BRANCH_NAME}"
        sh "echo ${env.GIT_BRANCH}"

        sh "./docker-build.sh ${env.BUILD_NUMBER}"
      }
    }

    stage ("Test") {
      steps {
        parallel (
          syntax: { sh "echo syntax" },
          grep: { sh "echo 'grep'" }
        )
      }
    }

    stage ('Apply') {
      input {
        message "Deseas continuar?"
        ok "Yes"
      }
      steps {
        echo "Continuara"
      }
    }

    stage("Upload") {
      when {
        expression {
          return params.UPLOAD ==~ /(?i)(Y|YES|T|TRUE|ON|RUN)/
        }
      }
      steps {
        withCredentials([usernamePassword(credentialsId: "${params.dockerhub-credential}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            sh "echo $PASSWORD | docker login -u $USER"
            sh "docker push mario21ic/dmc-api:${env.BUILD_NUMBER}"
        }
        /*
        build job: "another_job", parameters: [
          [$class: 'StringParameterValue', name: 'SLACK_CHANNEL', value: "monitoring"],
          [$class: 'StringParameterValue', name: 'SLACK_MESSAGE', value: "${params.SLACK_MESSAGE}"]
        ]
        */
      }
    }

  } 
  
  post {
    always {
      archiveArtifacts artifacts: "${ARTIFACTOR}", fingerprint: true, onlyIfSuccessful: true
      sh "rm -f ${ARTIFACTOR}"
      echo "Job has finished"
    }
  }
}

