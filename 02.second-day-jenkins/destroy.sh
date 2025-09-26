# pipeline {
#     agent any

#     stages {
#         stage('Clone Repo') {
#             steps {
#                 git branch: 'main', url: 'https://github.com/RKVankini/terraform.git'
#             }
#         }

#         stage('Terraform Init') {
#             steps {
#                 dir('3third-day-all-configrations') {
#                     sh 'terraform init'
#                 }
#             }
#         }

#         stage('Terraform Plan') {
#             steps {
#                 dir('3third-day-all-configrations') {
#                     sh 'terraform plan'
#                 }
#             }
#         }

#         stage('Terraform Apply') {
#             steps {
#                 input "Apply Terraform changes?"
#                 dir('3third-day-all-configrations') {
#                     sh 'terraform apply -auto-approve'
#                 }
#             }
#         }

#         stage('Wait Before Destroy') {
#             steps {
#                 echo 'Waiting for 5 minutes before destroy...'
#                 sleep(time: 5, unit: 'MINUTES')  // change to HOURS or SECONDS as needed
#             }
#         }

#         stage('Terraform Destroy') {
#             steps {
#                 dir('3third-day-all-configrations') {
#                     sh 'terraform destroy -auto-approve'
#                 }
#             }
#         }
#     }
# } 
