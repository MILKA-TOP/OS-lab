Sd#!bin/bash
cat pid4 | awk '
BEGIN {
ppid=0;
m=0;
count=0;
} {
now=substr($2, 6)
art=substr($3,5)
if (now == ppid) {
	count+=1;
	m+=art
} else {
	print "\nAverage_Running_Children_of_ParentID=" ppid " is " m / count "\n"
	count = 1
	ppid = now
	m=art
}
print $1"\t\t"$2"\t\t"$3
}' > pid5
