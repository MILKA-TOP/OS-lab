#!bin/bash
ps uxa | awk '{print $2, $11}' | grep "/sbin"  | awk '{print $1}' > pid2
