pipeline {
    triggers {
        pollSCM('* * * * *')
    }
    agent any
    tools {
        maven 'M2_HOME'
    }
    stages {
        stage('maven build') {
            steps {
                sh 'mvn clean'
                sh 'mvn install'
                sh 'mvn package'
            }
        }

        stage('maven test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('maven package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Only echoing deploy'
            }
        }
    }
}