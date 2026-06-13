#!/bin/bash
sudo docker rm -f my-java-app || true
sudo docker run -d --name my-java-app -p 8082:8082 secure-java-app:${BUILD_NUMBER}
