#!bin/bash
pid=$$
ppid=$PPID
#echo $pid, $ppid
ps ax o pid,ppid --sort=start_time | awk -v pid=$pid -v ppid=$ppid '{if ( $2 != pid && $2 != ppid) print $0 }' | tail -n1 | awk '{print $1}'
