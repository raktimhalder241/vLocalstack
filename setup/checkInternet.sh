#!/bin/bash -e

for FILE in utils/*; do
  . $FILE
done

sudo ls > /dev/null 2>&1
clear
hideCursor
trap cleanup EXIT

underLine "Checking Internet Connectivity"
installPkg "curl" "sudo apt -y install curl"

ipv4=0
if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  echo "IPv4 is up"
  ipv4=1
else
  echo "IPv4 is down"
fi

dns=0
if ping -q -c 1 -W 1 google.com >/dev/null; then
  echo "The network is up"
  dns=1
else
  echo "The network is down"
fi

http=0
case "$(curl -s --max-time 2 -I http://google.com | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
  [23]) echo "HTTP connectivity is up"
  http=1;;
  5) echo "The web proxy won't let us through";;
  *) echo "The network is down or very slow";;
esac

if [ "$ipv4" = "1" ]  && [  "$dns" = "1" ]  && [  "$http" = "1" ]  ; then
	doubleLine "Perfect Internet Connectivity"
else
	doubleLine "Check Internet Connectivity"
	exit 1
fi