#!/bin/bash

echo ">>Gathering Artifact Info<<"
echo "---------------------------"
source artifact_info
echo "Artifact Info Fetched..."
echo
echo ">>Downloading Artifact<<"
echo "------------------------"
curl -u $secret_USR:$secret_PSW -o demoapp.war http://$repo_url/$group/$artifactid/$version/$filename
echo
echo "Finished..."
echo
