pipeline {
    agent {
        label 'node2'
    }
    environment {
        secret= credentials('nexuscred')
        mnv_repo=""
    }
    stages {
        stage("Pull Artifact") {
            steps {
                sh 'curl -u ${env.secret_USR}:${env.secret_PSW} -o demoapp.war ""'
            }
        }
    }
}
