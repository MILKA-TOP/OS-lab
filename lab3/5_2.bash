#!bin/bash

type="+"
result=1
re='^[0-9]+'

(tail -f pipe) |
while true; do
    read line

    case "$line" in
    "QUIT")
	echo "RESULT: $result"
	killall tail
	exit 0
	;;
    "+")
	type="+"
	echo "PLUS:"
	;;
    "*")
	type="*"
	echo "MULT:"
	;;
    *)
	if [[ $line =~ $re ]]
	then
	    case "$type" in
	    "+") result=$((bc <<< '$result + $line'))
		;;
	    "*") result=$(bc <<< '($result * $line'))
		;;
	    esac
	else
	    echo "ERROR =$line="
	    killall tail
	    exit 1
	fi
	;;
    esac


done
