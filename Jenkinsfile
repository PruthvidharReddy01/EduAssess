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
                // Example for Maven project; adjust if you use Gradle, npm, etc.
                sh 'mvn clean package'
            }
            post {
                success {
                    archiveArtifacts artifacts: 'target/*.war', fingerprint: true
                }
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                // Stop Tomcat before deploying (optional but safer for redeploys)
                sh "${env.TOMCAT_HOME}/bin/shutdown.sh || true"
                sleep 5
                // Deploy the new WAR file (replace ROOT.war if deploying as the main app)
                sh "cp target/*.war ${env.TOMCAT_HOME}/webapps/${env.WAR_NAME}"
                // Start Tomcat again
                sh "${env.TOMCAT_HOME}/bin/startup.sh"
                // Wait for start
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
