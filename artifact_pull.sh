#!/bin/bash

repo_url="localhost:1081/repository/demo-maven-hosted-snapshot"
group="com/demo"
artifactid="demo-app"
version="1.0.0-SNAPSHOT"
filename="demo-app-1.0.0-20240915.205244-1.war"
curl -u $secret_USR:$secret_PSW -o demoapp.war http://$repo_url/$group/$artifactid/$version/$filename
