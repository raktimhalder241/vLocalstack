#!/bin/bash -e

cleanup() {
  showCursor
}
trap cleanup EXIT

showCursor() {
    tput cnorm
}

hideCursor() {
    tput civis
}

line="======================================="

underLine(){
	echo $1
	echo $line
}

doubleLine(){
	echo $line
	echo $1
	echo $line
	printf "\n\n"
}