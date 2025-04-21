pipeline {
  agent any

  stages {
    stage('Checkout Code') {
      steps {
        git 'https://github.com/your-org/your-repo.git'
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
