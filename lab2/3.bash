#!bin/bash
ps aux --sort=start_time | tail -n6 | head -n1 | awk '{print $0}'
