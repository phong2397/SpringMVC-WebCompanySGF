pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'sudo rm -rf /root/.jenkins/workspace/*'
                sh 'mvn clean install'
                sh 'sudo rm -rf /opt/os/apache-tomcat-8.5.60/webapps/sgfintech-admin.war'
                sh 'sudo rm -rf /opt/os/apache-tomcat-8.5.60/webapps/sgfintech-admin'
                sh 'sudo cp -p /root/.jenkins/workspace/sgfintech-admin/target/sgfintech-admin.war /opt/os/apache-tomcat-8.5.60/webapps/'
            }
        }
    }
}