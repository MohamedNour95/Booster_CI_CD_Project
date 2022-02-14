pipeline {
    agent {label "slave"}

    stages {
        stage('Preparation') {
            steps {                
                sh 'echo Preparation'
                git 'https://github.com/MohamedNour95/Booster_CI_CD_Project.git'
            }
        }    
        stage('Image build') {
            steps {
                sh 'echo Image build'
                sh 'docker build -t mohamednour95/ubuntu_py3 .'
            }
        }
        stage('Push image') {
            steps {
                withCredentials([usernamePassword(credentialsId:"docker",usernameVariable:"USERNAME",passwordVariable:"PASSWORD")]) {
                    sh 'echo Push image'
                    sh "docker login -u ${USERNAME} -p ${PASSWORD}"
                    sh 'docker push mohamednour95/ubuntu_py3 '
                }    
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo Deploy'
                sh 'docker run -d -p 8000:8000 mohamednour95/ubuntu_py3:latest'
            }
        }
        stage('Notification') {
            steps {
                sh 'echo Notification'                                
                post {
                    success {
                        slackSend (color: '#00FF00', message: "SUCCESS")
                    }
                                
                    failure {
                        slackSend (color: '#FF0000', message: "FAILED")
                    }
                }
            }
        }    
    }
}