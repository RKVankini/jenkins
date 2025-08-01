properties([
    parameters([
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Choose Terraform action')
    ])
])

node {
    // Set environment variable for the working directory
    env.TF_DIR = '3third-day-all-configrations'

    stage('Git Checkout') {
        git branch: 'main', url: 'https://github.com/RKVankini/terraform.git'
    }

    stage('Terraform Init') {
        dir(env.TF_DIR) {
            sh 'terraform init'
        }
    }

    stage('Terraform Plan') {
        dir(env.TF_DIR) {
            sh 'terraform plan'
        }
    }

    stage('Terraform Apply/Destroy') {
        dir(env.TF_DIR) {
            sh "terraform ${params.action} -auto-approve"
        }
    }
}
