#!bin/bash
while true
do
    read line
    echo "$line" > pipe
    if [[ "$line" == "QUIT" ]] 
    then
	exit 0
    elif ! [[ "$line" =~ "^[0-9]+$" ]]
    then
	if [[ "$line" != "+" ]] && [[ "$line" != "*" ]]
	then
	    echo "ERROR =$line="
	    exit 1
	fi
    fi
done
