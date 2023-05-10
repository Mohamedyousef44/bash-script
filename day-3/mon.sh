#!/bin/bash
## SCript monitors internet link min by min. In case of internet failure, log the date/time to logfile called /var/log/internet_fail
### The script runs to infinity, sleeps 60seconds between every iteration
## The corrrect solution, do not run the program with loop.
## Remove the while loop, and sleep
## Install the script in a cronjob
##	* * * * * .mon.sh
#Exit codes
#	0: success
#	1: Not run by root
source pingu.sh
[ ${USER} != "root" ] && echo "You are not a root .. " && exit 1
FLAG=1
while [ ${FLAG} -eq 1 ]
do
	pingHost "4.2.2.2"
	##Can not ping internet check local gateway 1st.
	## Local gateway is up and running, so the internet is down
	##	otherwise it is not an internet problem, restart your gw
	if [ ${?} -ne 0 ] 
	then
		GW=$(ip r | grep default | awk ' { print $3 } ')
		pingHost ${GW}
		if [ ${?} -eq 0 ]
		then
			echo "$(date)" >> /var/log/internet_fail
		fi
	fi
	sleep 60
done
exit 0
