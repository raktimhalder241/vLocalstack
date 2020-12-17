#!/bin/bash

SPNR_STR=".......( "
SPNR_END="  )"

installPkg() {
	PKG=$1
	CMD=$2
	
	if $PKG --version &> /dev/null
	then
		EXST_MSG="$PKG is already installed."
		echo "$EXST_MSG"
	else
		$CMD > /dev/null 2>&1  &
		showProgress "$PKG" "$CMD"
	fi
}

showProgress() {
	PKG=$1
	CMD=$2
	PID=$!

	spinner="◐ ◓ ◑ ◒"
	i=1
	PROG_MSG="$PKG installation in progress"
	while [ -d /proc/$PID ]
	do
		printf "\r$PROG_MSG"+"\b$SPNR_STR"+"\b${spinner:i++%${#spinner}:1}"+"\b$SPNR_END"
		sleep 0.2
	done

	echo -ne "\r                                                     "
	if $PKG --version &> /dev/null
	then
		CMPL_MSG="$PKG installation complete."
		echo -e "\r$CMPL_MSG"
	else
		FAIL_MSG="$PKG installation failed."
		echo -e "\r$FAIL_MSG"
		showCursor
		exit 1
	fi
}

refreshPkg() {
	PKG=$1
	CMD=$2
	$CMD > /dev/null 2>&1  &
	PID=$!

	spinner="◐ ◓ ◑ ◒"
	i=1
	PROG_MSG="$PKG in progress"
	while [ -d /proc/$PID ]
	do
		printf "\r$PROG_MSG"+"\b$SPNR_STR"+"\b${spinner:i++%${#spinner}:1}"+"\b$SPNR_END"
		sleep 0.2
	done

	echo -ne "\r                                                     "
	CMPL_MSG="$PKG complete."
	echo -e "\r$CMPL_MSG"
}