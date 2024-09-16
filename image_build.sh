#!/bin/bash

# condition returns 0 execute if block, otherwise execute else block

proxy_repo=""

base_image="tomcat:alpine"

if docker inspect $base_image &>/dev/null
then
        echo "$base_image exists"
        echo "No need to Pull..."
        docker build --build-arg image_name=$base_image -t demoapp .
        echo
        echo "Build Finished..."
else
        echo "$base_image Not Available on the Host"
        echo $secret_PSW | docker login -u $secret_USR --password-stdin $proxy_repo
        echo "Pull the image from https://$proxy_repo"
        docker pull $proxy_repo/$base_image
        docker tag $proxy_repo/$base_image $base_image
        docker logout
        echo
        docker build --build-arg image_name=$base_image -t demoapp .
        echo
        echo "Build Finished..."
fi
