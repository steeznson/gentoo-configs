setxkbmap -layout gb;
while true; do
	DATE="$( date '+%F %R' )"
	CAP="$(df -H | grep -vE '^Filesystem|devtmpfs|tmpfs|shm|cgroup_root|none' | awk '{print$4 " " $1}')"
	xsetroot -name "$( echo $DATE $CAP )"
    	sleep 1m;    # Update time every minute
done &
sh ~/.fehbg;
exec dwm
