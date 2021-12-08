
net start > service_list1.txt

net stop dnscache

timeout 8

net start > service_list2.txt

call C:\Users\IEUser\lab6\2-script\compare_files.bat service_list1.txt service_list2.txt > service_dif.txt

net start dnscache