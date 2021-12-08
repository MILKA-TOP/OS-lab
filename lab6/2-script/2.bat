
hostname

cd C:\
mkdir %COMPUTERNAME%\temp

net share temp=C:\%COMPUTERNAME%\temp /grant:everyone,FULL


cd C:\Users\IEUser\lab6\2-script

start copy_bat.bat


cd C:\Users\IEUser\lab6\2-script

SCHTASKS /Create /SC MINUTE /TN copy /TR copy_bat.bat