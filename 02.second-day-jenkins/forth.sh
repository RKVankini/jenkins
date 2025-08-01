pipeline {
    agent any

    parameters {
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Choose Terraform action')
    }

    environment {
        TF_DIR = '3third-day-all-configrations'  // 🔁 Centralized working directory
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/RKVankini/terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir(env.TF_DIR) {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir(env.TF_DIR) {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply/Destroy') {
            steps {
                echo "⚙️ Running: terraform ${params.action} ..."
                dir(env.TF_DIR) {
                    sh "terraform ${params.action} -auto-approve"
                }
            }
        }
    }

    post {
        success {
            echo "✅ Terraform ${params.action} completed successfully."
        }
        failure {
            echo "❌ Terraform ${params.action} failed."
        }
    }
}
