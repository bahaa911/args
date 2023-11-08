 pipeline {

     agent any
		
		stages {
			stage('Clone repo') {
				steps {
                git branch: 'main', credentialsId: 'CI_bitbucket_with_password', url: 'https://github.com/bahaa911/args.git'
            }
        }
        stage ('Build test Docker') {
            steps {
                script {
				bat 'docker build -t testdocker ./'
				
                     }
            }
        }
      
        stage ('Run Jmeter Docker') {
            steps {
				script{
                bat 'docker run -t -v D:\\QIQ\\courses\\Run_From_CMD:/data testdocker opensource-orangehrmlive.jmx' 
                
				}
			}
        }
		
		}
	}
