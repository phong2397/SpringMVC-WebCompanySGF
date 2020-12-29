pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'sudo rm -rf /opt/os/apache-tomcat-8.5.60/webapps/sgfintech-admin.war'
                sh 'sudo rm -rf /opt/os/apache-tomcat-8.5.60/webapps/sgfintech-admin'
                sh 'mvn clean install'
                sh 'sudo cp -p /root/.jenkins/workspace/sgfintech-admin@2/target/sgfintech-admin.war /opt/os/apache-tomcat-8.5.60/webapps/'
            }
        }
    }
}