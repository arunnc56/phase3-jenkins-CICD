pipeline {
  agent any

  stages {
    stage('Checkout Code') {
      steps {
        git 'https://github.com/arunnc56/phase3-jenkins-CICD.git'
      }
    }

    stage('Build') {
      steps {
        echo 'Building the project with Maven...'
        sh 'mvn clean install -DskipTests'
      }
    }

    stage('Test') {
      steps {
        echo 'Running tests with Maven...'
        sh 'mvn test'
      }
    }

    stage('Deploy') {
      steps {
        echo 'Running deployment script...'
        sh './deploy.sh'
      }
    }
  }
}
