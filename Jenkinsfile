pipeline {
  agent any

  environment {
    AWS_REGION = 'us-east-1'          // Example: us-east-1
    S3_BUCKET = 'my-bucket-phase2'       // Example: my-jenkins-builds
    S3_KEY = 'build.zip' // Path inside the bucket
    APPLICATION_NAME = 'Jenkins-App' // Example: MyCodeDeployApp
    DEPLOYMENT_GROUP = 'Phase3-Jenkins-group' // Example: MyDeploymentGroup
  }

  stages {
    stage('Checkout Code') {
      steps {
        git branch: 'main', url: 'https://github.com/arunnc56/phase3-jenkins-CICD.git'
      }
    }

    stage('Build') {
      steps {
        echo '🔧 Building the project with Maven...'
        sh 'mvn clean install -DskipTests'
      }
    }

    stage('Test') {
      steps {
        echo '🧪 Running tests with Maven...'
        sh 'mvn test'
      }
    }

    stage('Package Artifacts') {
      steps {
        echo '📦 Packaging build and appspec.yml...'
        sh '''
          mkdir -p deploy
          cp target/*.jar deploy/
          cp appspec.yml deploy/
          cp deploy.sh deploy/
          cd deploy
          zip -r build.zip .
        '''
      }
    }

    stage('Upload to S3') {
      steps {
        echo '☁️ Uploading build to S3...'
        sh 'aws s3 cp deploy/build.zip s3://$S3_BUCKET/$S3_KEY --region $AWS_REGION'
      }
    }

    stage('Trigger Deployment') {
      steps {
        echo '🚀 Triggering CodeDeploy Deployment...'
        sh '''
          aws deploy create-deployment \
            --application-name $APPLICATION_NAME \
            --deployment-group-name $DEPLOYMENT_GROUP \
            --s3-location bucket=$S3_BUCKET,key=$S3_KEY,bundleType=zip \
            --region $AWS_REGION
        '''
      }
    }
  }
}
