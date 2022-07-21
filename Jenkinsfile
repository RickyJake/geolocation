pipeline {
    agent any
    tools {
        maven 'M2_HOME'
    }
    stages {
        stage('maven package') {
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

        stage('Deploy') {
            steps {
                echo 'deploy'
            }
        }
    }
}