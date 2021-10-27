#!bin/bash
ps uxa | awk '{print $2, $11}' | grep '/sbin/'  | awk '
{ 
    if (match($2, "/sbin") == 1 ) {
	print $1
    }
}' > pid2
