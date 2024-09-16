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
    }
}
