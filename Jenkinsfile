pipeline {
    agent {
        label 'node2'
    }
    environment {
        secret= credentials('nexuscred')
    }
    stages {
        stage("Pull Artifact") {
            steps {
                sh "bash artifact_pull.sh"
            }
        }
        stage("Dcoker Image Build") {
            steps {
                sh "bash image_build_push.sh"
            }
        }
    }
    post {
        always {
            cleanWs ()
        }
    }
}
