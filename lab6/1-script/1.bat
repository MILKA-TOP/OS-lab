cd C:\
mkdir LAB6

cd LAB6
ver > ver.txt
mem > mem.txt
wmic logicaldisk > wmic.txt

mkdir TEST
copy * TEST
cd TEST

copy * names.txt

del mem.txt wmic.txt ver.txt

cd C:\Users\IEUser\lab6\1-script
