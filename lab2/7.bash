#!bin/bash
list=$(ps aux | awk '{print $2}' | sed 1d)
outtext=""
finaltext=""

for pid in $list
do

    if [[ -f /proc/$pid/io ]]
    then
	val=$(grep "read_bytes" /proc/$pid/io | awk '{print $2}')

	outtext=$outtext"PID"$pid"\t"$val"\n"
    fi

done

sleep 60s

for pid in $list
do

    if [[ -f /proc/$pid/io ]]
    then
	newval=$(grep "read_bytes" /proc/$pid/io | awk '{print $2}')
	oldline=$(echo -e $outtext | grep "PID"$pid)
	oldval=$(echo -e $oldline | awk '{print $2}')

	let delta=$newval-$oldval
	finaltext=$finaltext"PID:\t"$pid"\tDATA:\t"$delta"\n"
    fi

done

echo -e $finaltext | sort -nk4 | sed 1d | head -n 3


