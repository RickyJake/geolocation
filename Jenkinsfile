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
                script {
                    def mavenPom = readMavenPom file: 'pom.xml'

                    nexusArtifactUploader artifacts: [[artifactId: "${mavenPom.artifactId}", 
                classifier: '', file: "target/${mavenPom.artifactId}-${mavenPom.version}.${mavenPom.packaging}", 
                type: "${mavenPom.packaging}"]], credentialsId: 'NexusID', groupId: "${mavenPom.groupId}", 
                nexusUrl: '192.168.43.145:8081', nexusVersion: 'nexus3', protocol: 'http', 
                repository: 'pipeline', version: "${mavenPom.version}"
                }
                
            }
        }
    }
}