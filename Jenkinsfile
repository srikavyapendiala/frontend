pipeline{
    agent {
        label 'NODEJS'
    }
    stages {
        stage('Download Dependencies')  {
            steps {
               sh '''
                npm install
            '''
            }
        }
        stage('prepare Artifacts') {
            steps {
                sh '''
                zip -r frontend.zip *
            '''
            }
        }
        stage('upload Artifacts') {
            steps {
                sh '''
              curl -f -v -u admin:kavya --upload-file frontend.zip http://172.31.6.66:8081/repository/frontend/frontend.zip
            '''
            }
        }
    }
}

