#!/bin/bash

sudo ls > /dev/null 2>&1

printf "downloading aws-cli zip ...\n"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" > /dev/null 2>&1  &

printf "\nzipping docker image localstack/java-maven-node-python ...\n"
sudo docker pull localstack/java-maven-node-python:latest
sudo docker save localstack/java-maven-node-python -o java-maven-node-python.tar
sudo zip java-maven-node-python.tar.zip java-maven-node-python.tar
sudo rm java-maven-node-python.tar > /dev/null 2>&1  &

printf "\nzipping docker image localstack/localstack ...\n"
sudo docker pull localstack/localstack:latest
sudo docker save localstack/localstack -o localstack.tar
sudo zip localstack.tar.zip localstack.tar
sudo rm localstack.tar > /dev/null 2>&1  &

printf "\nzipping pkg ..."
mkdir pkg
mv awscliv2.zip pkg/awscliv2.zip
mv java-maven-node-python.tar.zip pkg/java-maven-node-python.tar.zip
mv localstack.tar.zip pkg/localstack.tar.zip
zip -r pkg.zip pkg
sudo rm -r pkg