pipeline {
    agent any

    parameters {
        string(
            name: 'SCRIPTS',
            description: 'Comma-separated list of JMeter Scripts (e.g., opensource-orangehrmlive.jmx,opensource-orangehrmlive1.jmx)',
            defaultValue: 'opensource-orangehrmlive.jmx,opensource-orangehrmlive1.jmx'
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
                    // Split the parameter value by comma and store it in an array
                    def scripts = params.SCRIPTS.split(',')
                    // Loop through the array and run each script
                    for (script in scripts) {
                        bat "docker run -t -v D:\\QIQ\\courses\\Run_From_CMD:/data testdocker ${script}"
                    }
                }
            }
        }
    }

    post {
        always {
            bat 'Docker system prune --all -f'
            deleteDir()
        }
    }
}
