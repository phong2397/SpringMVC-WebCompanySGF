pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
                sh '/opt/os/apache-tomcat-8.5.60/bin/shutdown.sh'
                sh '/opt/os/apache-tomcat-8.5.60/bin/startup.sh'
            }
        }
    }
}