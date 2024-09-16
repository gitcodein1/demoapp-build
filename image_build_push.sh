#!/bin/bash

# command returns 0 execute if block, otherwise execute else block

source registries
source artifact_info

if docker inspect $base_image &>/dev/null
then
        echo "$base_image exists on the Host"
        echo "No need to Pull..."
        echo ">>Build with the Existing Image<<"
        echo "---------------------------------"
        docker build --build-arg image_name=$base_image -t $snapshot_repo/demoapp:$version .
        echo
        echo "Build Finished..."
else
        echo "$base_image Not Available on the Host"
        echo
        echo $secret_PSW | docker login -u $secret_USR --password-stdin $proxy_repo
        echo "Pulling $base_image from https://$proxy_repo"
        echo
        docker pull $proxy_repo/$base_image
        echo ">>TAG the Image<<"
        echo "-----------------"
        docker tag $proxy_repo/$base_image $base_image
        echo "$proxy_repo/$base_image tagged to $base_image"
        docker logout
        echo
        echo ">>Build Starts<<"
        echo "----------------"
        docker build --build-arg image_name=$base_image -t $snapshot_repo/demoapp:$version .
        echo
        echo "Build Finished..."
        echo
fi

echo ">>Push Image<<"
echo "--------------"
echo $secret_PSW | docker login -u $secret_USR --password-stdin $snapshot_repo
docker pull $snapshot_repo/demoapp:$version
echo
echo "Image Pushed..."
echo
docker logout
echo

echo ">>Clean Up<<"
echo "------------"
docker rmi $proxy_repo/$base_image $base_image
