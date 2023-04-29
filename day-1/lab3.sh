#! /bin/bash

# parameters

## file name 

# exit codes

##  0: success
##  1: check if root user or not
##  2: one parameter input
##  3: file not found 

[ "$(id -u)" != "0" ] && exit 1
[ ${#} -ne 1 ] && exit 2

FILENAME=${1}

[ ! -f ${FILENAME} ] && exit 3

# This script will monitor the system load every minute and print the results t$

while true;
do

  # Get the system load averages
  load_averages=$(uptime)

  # Print the system load averages to the file
  echo ${load_averages} >> ${FILENAME}

  # Sleep for 1 minute
  sleep 60

done

exit 0