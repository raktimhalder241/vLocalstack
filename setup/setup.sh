#!/bin/bash -e
source utils/package.sh
source utils/formatting.sh
source version.sh

sudo ls > /dev/null 2>&1
clear
hideCursor
trap cleanup EXIT

bash checkInternet.sh

underLine "Refreshing Packages"
refreshPkg "updation" "sudo apt -y update"
refreshPkg "upgradation" "sudo apt -y upgrade"
doubleLine "Packages have been Refreshed"

underLine "Pre-requisite for LocalStack framework"
installPkg "python3" "sudo apt install -y python3"
installPkg "pip3" "sudo apt install -y python3-pip"
refreshPkg "libsasl2-dev installation" "sudo apt install -y libsasl2-dev"
doubleLine  "Pre-requisites have been Installed"

underLine "Container to run LocalStack"
installPkg "docker" "sudo apt install -y docker.io"
installPkg "docker-compose" "sudo apt install -y docker-compose"
doubleLine "Container setup is Complete"

bash src/unzip/unzip.sh

createDockerCompose
doubleLine "Docker-compose.yml has been Created"