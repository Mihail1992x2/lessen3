pipeline { 
    agent any 

    stages { 
        stage('Git checkout') { 
           steps{ 
                git branch: 'main', darinpope-aws-creds: 'Github', url: 'https://github.com/Mihail1992x2/lessen3.git' 
            } 
        } 
        stage('terraform format check') { 
            steps{ 
                sh 'terraform fmt' 
            } 
        } 
        stage('terraform Init') { 
            steps{ 
                sh 'terraform init' 
            } 
        } 
        stage('terraform apply') { 
            steps{ 
                sh 'terraform apply --auto-approve' 
            } 
        } 
    } 
 
     
}
