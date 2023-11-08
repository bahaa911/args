pipeline {
    agent any

    parameters {
        string(
            name: 'SELECTED_SCRIPT',
            description: 'Selected JMeter Script (e.g., opensource-orangehrmlive.jmx or opensource-orangehrmlive1.jmx)',
            defaultValue: 'opensource-orangehrmlive.jmx'
        )
    }

    stages {
        stage('Set Build Display Name') {
            steps {
                script {
                    def selectedScript = params.SELECTED_SCRIPT
                    currentBuild.displayName = selectedScript
                }
            }
        }

        stage('Parallel Stages') {
            parallel {
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

        stage('Run Jmeter Docker') {
            steps {
                script {
                    // Use the current build's display name as the selected script
                    def selectedScript = currentBuild.displayName
                    bat "docker run -t -v D:\\QIQ\\courses\\Run_From_CMD:/data testdocker ${selectedScript}"
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
