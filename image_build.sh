#!/bin/bash

# condition returns 0 execute if block, otherwise execute else block

proxy_repo=""

base_image="tomcat:alpine"

if docker inspect $base_image &>/dev/null
then
        echo "$base_image exists"
        docker build --build-arg image_name=$base_image -t demoapp .
else
        echo $secret_PSW | docker login -u $secret_USR --password-stdin $proxy_repo
        docker pull $proxy_repo/$base_image
        docker tag $proxy_repo/$base_image $base_image
        docker logout
        docker build --build-arg image_name=$base_image -t demoapp .
fi
