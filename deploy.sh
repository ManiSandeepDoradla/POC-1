#!/bin/bash

BUILD_NUM=$1
echo "Deploying Build Number: ${BUILD_NUM}"

# 1. FIND AND KILL ANY CONTAINER HOGGING PORT 8082 (BY PORT, NOT BY NAME)
echo "Clearing out anything running on port 8082..."
TARGET_PORT_CONTAINER=$(sudo docker ps -q --filter "publish=8082")

if [ ! -z "$TARGET_PORT_CONTAINER" ]; then
    echo "Found blocking container ID: $TARGET_PORT_CONTAINER. Removing it..."
    sudo docker rm -f $TARGET_PORT_CONTAINER
fi

# 2. Also remove any container using our target name to avoid naming conflicts
sudo docker rm -f my-java-app || true

# 3. Launch the fresh container cleanly
echo "Launching fresh container secure-java-app:${BUILD_NUM} on port 8082..."
sudo docker run -d --name my-java-app -p 8082:8080 secure-java-app:${BUILD_NUM}

echo "Deployment Successful!"
