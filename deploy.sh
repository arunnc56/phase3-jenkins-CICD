#!/bin/bash

# Stop the current application (if running)
echo "🔴 Stopping existing application..."
pkill -f 'java -jar' || echo "No running app found."

# Navigate to build output
cd target || { echo "❌ Build folder not found!"; exit 1; }

# Deploy the latest jar (replace with your actual jar name or pattern)
JAR_FILE=$(ls *.jar | head -n 1)

if [[ -z "$JAR_FILE" ]]; then
  echo "❌ No JAR file found in target directory!"
  exit 1
fi

echo "🚀 Deploying $JAR_FILE..."
nohup java -jar "$JAR_FILE" > app.log 2>&1 &

echo "✅ Deployment finished! App running in background."
