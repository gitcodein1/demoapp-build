#!/bin/bash

# condition returns 0 execute if block, otherwise execute else block

proxy_repo="e5e6-183-87-250-107.ngrok-free.app"

base_image="tomcat:alpine"

if docker inspect $image_name &>/dev/null
then
        docker build -t demoapp .
else
        echo $secret_PSW | docker login -u $secret_USR --password-stdin $proxy_repo
        docker pull $proxy_repo/$base_image
        docker tag $proxy_repo/$base_image $base_image
        docker logout
        docker build -t demoapp .
fi
