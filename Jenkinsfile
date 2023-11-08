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
        stage('Parallel Stages') {
            parallel {
                stage('Print Numbers') {
                    steps {
                        script {
                            for (int i = 1; i <= 20; i++) {
                                echo "Number: $i"
                                sleep(1) // Sleep for 1 second between each print
                            }
                        }
                    }
                }
            }
        }

        stage('Build and Run Docker') {
            steps {
                script {
                    parallel(
                        clone: {
                            stage('Clone repo') {
                                git branch: 'main', credentialsId: 'CI_bitbucket_with_password', url: 'https://github.com/bahaa911/args.git'
                            }
                        },
                        build: {
                            stage('Build test Docker') {
                                bat 'docker build -t testdocker ./'
                            }
                        },
                        run: {
                            stage('Run Jmeter Docker') {
                                def selectedScript = params.JMETER_SCRIPT
                                bat "docker run -t -v D:\\QIQ\\courses\\Run_From_CMD:/data testdocker ${selectedScript}"
                            }
                        }
                    )
                }
            }
        }
    }
}
