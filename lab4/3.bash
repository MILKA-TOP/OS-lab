#!bin/bash
minus_number=7
date_now=$(date +%F)
cd /home/user
last_dir_name=$(ls | grep -E '\bBackup-([0-9][0-9][0-9][0-9])-(0[0-9]|1[0-2])-([0-2][0-9]|30)\b' | sort -nr | head -1)
was_created=false


if [ -z "$last_dir_name" ]; then
    now_dir_name="Backup-$date_now"
else
    while [ "$minus_number" -ge "0" ]
    do

	dir_date=$(date -d "-$minus_number day" +%F)
	now_dir_name="Backup-$dir_date"

	if [ "$now_dir_name" = "$last_dir_name" ]; then
	    break
	fi
	(( minus_number-- ))

    done
fi

if ! [ -d "source" ]; then
    echo "ERROR: source directory is not exist"
    exit 1
fi

if ! [ -d "$now_dir_name" ]; then
    mkdir "$now_dir_name"
    was_created=true
fi

if ! [ -f "./backup-report" ]; then
    touch "backup-report"
fi

echo "===============START===============" >> "backup-report"
if [ "$was_created" = true ]; then
    full_time=$(date)
    echo "Created directory $now_dir_name at $full_time" >> "backup-report"
else
    echo "Using directory $now_dir_name" >> "backup-report"
fi

cd "./source"
f_source="../$now_dir_name"
list=$(ls)

for elem in $list
do
    if [ -f "$elem" ] || [ -d "$elem" ]; then
	if [ "$was_created" = false ]; then
	    if ! [ -f "$f_source/$elem" ] && ! [ -d "$f_source/$elem" ]; then
		cp -R "$elem" "$f_source"
		echo "Created $elem" >> "../backup-report"
		continue
	    fi

	    old_size=$(du "$f_source/$elem" | awk '{print $1}')
	    new_size=$(du "$elem" | awk '{print $1}')

	    if [ "$old_size" -eq "$new_size" ]; then
		continue
	    fi
	    mv -f "$f_source/$elem" "$f_source/$elem.$date_now"
	    cp -R "$elem" "$f_source"
	    echo "Rewrited $elem to $elem.$date_now" >> "../backup-report"

	else
	    echo "Created $elem" >> "../backup-report"
	    cp -R "$elem" "$f_source"
	fi
    fi
done
echo "===============END================" >> "../backup-report"

