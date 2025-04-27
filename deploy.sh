#!/bin/bash

echo "🔴 Stopping existing application..."
pkill -f 'java -jar' || echo "No running app found."

echo "📦 Looking for jar file..."
JAR_FILE=$(find . -name "*.jar" | head -n 1)

if [ -z "$JAR_FILE" ]; then
  echo "❌ No .jar file found!"
  exit 1
fi

echo "✅ Found: $JAR_FILE"
echo "🚀 Starting new application..."
nohup java -jar "$JAR_FILE" > output.log 2>&1 &
