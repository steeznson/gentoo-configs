setxkbmap -layout gb;
while true; do
	DATE="$( date '+%F %R' )"
	xsetroot -name "$( echo $DATE )"
    	sleep 1m;    # Update time every minute
done &
sh ~/.fehbg;
exec dwm
