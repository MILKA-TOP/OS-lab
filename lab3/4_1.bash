#!bin/bash
bash 4_2.bash &
cpulimit --limit=10 -p $! &
bash 4_2.bash &
bash 4_2.bash &
#bash 4_2.bash &
