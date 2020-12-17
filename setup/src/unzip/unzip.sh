#!/bin/bash

sudo ls > /dev/null 2>&1
cd src/unzip

echo "unpacking package zip ..."
unzip ../zip/pkg.zip

printf "\nsetting up aws-cli ..."
unzip pkg/awscliv2.zip -d pkg > /dev/null 2>&1  &
sudo pkg/aws/install > /dev/null 2>&1  &
rm pkg/awscliv2.zip > /dev/null 2>&1  &

printf "\nloading docker image localstack/java-maven-node-python ...\n"
unzip pkg/java-maven-node-python.tar.zip -d pkg
sudo docker load -i pkg/java-maven-node-python.tar > /dev/null 2>&1  &
rm pkg/java-maven-node-python.tar.zip > /dev/null 2>&1  &

printf "\nloading docker image localstack/localstack ...\n"
unzip pkg/localstack.tar.zip -d pkg
sudo docker load -i pkg/localstack.tar > /dev/null 2>&1  &
rm pkg/localstack.tar.zip > /dev/null 2>&1  &

cd ../../