pipeline {
    triggers {
        pollSCM('* * * * *')
    }
    agent any
    tools {
        maven 'M2_HOME'
    }
    stages {
        stage('maven clean') {
            steps {
                sh 'mvn clean'
            }
        }

        stage('maven build') {
            steps {
                sh 'mvn install'
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

        stage('Upload Artifact') {
            steps {
                nexusArtifactUploader artifacts: [[artifactId: '${POM_ARTIFACTID}', 
                classifier: '', file: 'target/${POM_ARTIFACTID}-${POM_VERSION}.${POM_PACKAGING}', 
                type: '${POM_PACKAGING}']], credentialsId: 'NexusID', groupId: '${POM_GROUPID}', 
                nexusUrl: '192.168.43.145:8081', nexusVersion: 'nexus3', protocol: 'http', 
                repository: 'pipeline', version: '${POM_VERSION}'
            }
        }
    }
}