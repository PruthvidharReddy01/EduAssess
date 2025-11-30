pipeline {
    agent any

    tools {
        maven 'MAVEN_HOME' 
        jdk 'JAVA_HOME'
    }

    environment {
        REPO_URL = 'https://github.com/PruthvidharReddy01/EduAssess.git'
        
        // TODO: UPDATE THIS PATH! Example: 'C:\\apache-tomcat-9.0.80'
        // Note: Use double backslashes (\\) for Windows paths in Groovy
        TOMCAT_HOME = 'C:\\Path\\To\\Your\\Tomcat' 
        
        WAR_NAME = 'EduAssessPro.war'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: "${env.REPO_URL}"
            }
        }

        stage('Build') {
            steps {
                // CHANGED: 'sh' to 'bat' for Windows
                bat 'mvn clean package'
            }
            post {
                success {
                    // Archive the artifact from build_output
                    archiveArtifacts artifacts: 'build_output/*.war', fingerprint: true
                }
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                script {
                    echo "Deploying to Tomcat at ${env.TOMCAT_HOME}"
                    
                    // 1. Stop Tomcat (using shutdown.bat)
                    // 'call' is used to ensure the batch script executes properly
                    try {
                        bat "call \"${env.TOMCAT_HOME}\\bin\\shutdown.bat\""
                    } catch (Exception e) {
                        echo "Tomcat might not be running, proceeding..."
                    }
                    sleep 5

                    // 2. Copy the WAR file (using Windows 'copy')
                    // We use backslashes for Windows paths
                    bat "copy \"build_output\\*.war\" \"${env.TOMCAT_HOME}\\webapps\\${env.WAR_NAME}\""

                    // 3. Start Tomcat (using startup.bat)
                    // We use 'start' so Jenkins doesn't hang waiting for Tomcat to finish
                    bat "call \"${env.TOMCAT_HOME}\\bin\\startup.bat\""
                    sleep 10
                }
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
}
