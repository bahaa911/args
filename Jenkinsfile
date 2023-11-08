pipeline {
    agent any

    parameters {
        choice(
            name: 'JMETER_SCRIPT',
            choices: 'opensource-orangehrmlive.jmx\nopensource-orangehrmlive1.jmx',
            description: 'Select the JMeter script:'
        )
    }

    stages {
        stage('Clone repo') {
            steps {
                git branch: 'main', credentialsId: 'CI_bitbucket_with_password', url: 'https://github.com/bahaa911/args.git'
            }
        }

        stage('Build test Docker') {
            steps {
                script {
                    bat 'docker build -t testdocker ./'
                }
            }
        }

        stage('Run Jmeter Docker') {
            steps {
                script {
                    def selectedScript = params.JMETER_SCRIPT
                    bat "docker run -t -v D:\\QIQ\\courses\\Run_From_CMD:/data testdocker ${selectedScript}"
                }
            }
        }
    }

    post {
        always {
            blueOcean()
        }
    }
}
