#     1  sudo yum install java-17-amazon-corretto.x86_64 -y
#     2  sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
#     3  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
#     4  sudo yum install jenkins -y
#     5  sudo systemctl enable jenkins
#     6  sudo systemctl start jenkins
#     7  sudo yum install -y yum-utils
#     8  sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
#     9  sudo yum -y install terraform

    pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/RKVankini/terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('3third-day-all-configrations') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('3third-day-all-configrations') {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input "Apply Terraform changes?"
                dir('3third-day-all-configrations') {
                    sh 'terraform {action} -auto-approve' # before giving action we have to add perameters
                }
            }
        }
    }
}
