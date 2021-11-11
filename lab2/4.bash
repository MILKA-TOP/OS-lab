#!bin/bash
list=$(ps aux | awk '{print $2}' | sed 1d)
outtext=""
for pid in $list
    do
        cp /proc/$pid/status status$pid 2>/dev/null
        cp /proc/$pid/sched sched$pid 2>/dev/null
	if [[ -s sched$pid ]] && [[ -s status$pid ]]
	then
	    ppid=$(grep "PPid" status$pid | awk '{print $2}')
	    runtime=$(grep "sum_exec_runtime" sched$pid | awk '{print $3}')
	    switches=$(grep "nr_switches" sched$pid | awk '{print $3}')
	    art=$(echo $runtime " "  $switches | awk '{print $1 / $2}')
	    outtext=$outtext$pid"\t"$ppid"\t"$art"\n"
	fi
	    rm -f status$pid
	    rm -f sched$pid

done

echo -e $outtext | sort -n -k2 | sed 1d | awk '{print "PID="$1"\t\tPPID="$2"\t\tART="$3}' > pid4
