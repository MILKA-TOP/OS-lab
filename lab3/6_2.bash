#!bin/bash
echo $$ > .pid
type="+"
val=1
usr1()
{
type="+"
}

usr2()
{
type="*"
}

sigterm()
{
echo "STOP"
exit 0
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'sigterm' SIGTERM

while true; do

    case "$type" in
    "+")
	val=$(($val + 2))
	;;
    "*")
	val=$(($val * 2))
	;;
    esac
    sleep 1
    echo "$val"


done
