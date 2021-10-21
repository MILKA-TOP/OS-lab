#!bin/bash
list=$(ps aux | awk '{print $2}' | sed 1d)
outtext=""
for pid in $list
    do
	if [[ -f /proc/$pid/status && -f /proc/$pid/sched ]]
	then

	    ppid=$(grep "PPid" /proc/$pid/status | awk '{print $2}')
	    runtime=$(grep "sum_exec_runtime" /proc/$pid/sched | awk '{print $3}')
	    switches=$(grep "nr_switches" /proc/$pid/sched | awk '{print $3}')
	    art=$(echo $runtime " "  $switches | awk '{print $1 / $2}')
	    outtext=$outtext$pid"\t"$ppid"\t"$art"\n"

	fi
done

echo -e $outtext | sort -n -k2 | sed 1d | awk '{print "PID="$1"\t\tPPID="$2"\t\tART="$3}' > pid4
