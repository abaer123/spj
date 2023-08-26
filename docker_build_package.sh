#!/bin/sh
echo "building docker image"
docker build -t spring-petclinic:latest . 
echo "saving docker image to .tar"
docker save spring-petclinic:latest > spring-petclinic.tar