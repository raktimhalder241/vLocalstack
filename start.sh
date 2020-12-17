#!/bin/bash

sudo ls > /dev/null 2>&1
clear

gnome-terminal --tab
sudo service docker restart && sudo docker-compose up