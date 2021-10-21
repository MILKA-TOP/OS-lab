#!bin/bash
list=$(ps aux | awk '{print $2}' | sed 1d)
bigpid=0
maxval=0
for pid in $list
do

    if [[ -f /proc/$pid/status ]]
    then

	nowval=$(grep "VmRSS" /proc/$pid/status | awk '{print $2}')

	if [[ $nowval != "" && $nowval -ge $maxval ]]
	then
	    maxval=$nowval
	    bigpid=$pid

	fi

fi
done

echo -e "PID:" $maxval "\tMEM:" $bigpid 
