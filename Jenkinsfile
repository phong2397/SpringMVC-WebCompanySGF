pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'sudo rm -rf /opt/os/apache-tomcat-8.5.61/webapps/sgfintech-admin.war'
                sh 'sudo rm -rf /opt/os/apache-tomcat-8.5.61/webapps/webapps/sgfintech-admin'
                sh 'mvn clean install'
                sh 'sudo cp -p /root/.jenkins/workspace/sgfintech-admin/target/sgfintech-admin.war /opt/os/apache-tomcat-8.5.61/webapps/'
            }
        }
    }
}