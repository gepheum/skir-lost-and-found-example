#!/bin/bash

set -e

# Set Java home for Gradle
export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home

# Format Skir code
npx skir format

# Generate Skir code
npx skir gen

# Build backend
cd backend
./gradlew ktlintFormat
./gradlew build
cd ..

# Build frontend
cd frontend
npm install
npm run build
cd ..

echo "✅ Pre-commit checks passed!"
