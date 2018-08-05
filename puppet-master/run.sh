#!/bin/bash

IMAGE_NAME=$1
IS_BUILD_IMAGE=$2

while getopts bn: option
do
    case "${option}" in
        n) IMAGE_NAME=${OPTARG};;
        b) IS_BUILD_IMAGE=${OPTARG};;  
        ?) echo "Error" && exit -1;;
        *) echo "to build image use -b true"            
    esac
done

function buildAndRun {

    echo "$IMAGE_NAME || $IS_BUILD_IMAGE"

    if [ -z $IMAGE_NAME ]; then
        echo "Container name not passed, using default name..."
        IMAGE_NAME="puppet-master-image"
    fi

    docker rm -f $IMAGE_NAME

    if [  "$IS_BUILD_IMAGE" = true ]; then
        docker build . -t puppet-master:0.1
    fi

    echo "Starting container...."
    winpty docker run -d -i -t -p 18040:8040 --name $IMAGE_NAME puppet-master:0.1
    
    docker ps
}

buildAndRun
exit 0;
 