pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/PruthvidharReddy01/EduAssess.git'
        TOMCAT_HOME = '/opt/tomcat' // Adjust based on your Tomcat path
        WAR_NAME = 'eduassess.war'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Jenkins will checkout code by default, but you can explicitly do this
                git branch: 'main', url: "${env.REPO_URL}"
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    // FIXED: Changed 'target' to 'build_output'
                    archiveArtifacts artifacts: 'build_output/*.war', fingerprint: true
                }
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh "${env.TOMCAT_HOME}/bin/shutdown.sh || true"
                sleep 5
                // FIXED: Changed 'target' to 'build_output'
                sh "cp build_output/*.war ${env.TOMCAT_HOME}/webapps/${env.WAR_NAME}"
                sh "${env.TOMCAT_HOME}/bin/startup.sh"
                sleep 10
            }
        }

        stage('Post-Deployment Check') {
            steps {
                script {
                    // Adjust this URL as needed
                    def response = sh(script: "curl -s -o /dev/null -w '%{http_code}' http://localhost:8080/${env.WAR_NAME.replace('.war', '')}/", returnStdout: true)
                    if (response.trim() != '200') {
                        error "Web app did not start correctly. Got HTTP ${response}"
                    }
                }
                echo "Web app running and accessible!"
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
